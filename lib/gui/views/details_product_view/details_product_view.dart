import 'package:flutter/material.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/pipe_widget.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class DetailProductView extends StatefulWidget {
  final ProductsModel? product;
  const DetailProductView({ Key? key, this.product }) : super(key: key);

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  int cantidad = 1;
  int priceTotal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    Size media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.product!.id!,
              child: Image.network(widget.product!.img!, width: media.width * 1.0, height: media.height * .4,),
            ),
            const SizedBox(height: 20.0),
            Text(widget.product!.name!, style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 24.0)),
            Text(PipeWidget().formato(int.parse(widget.product!.price!)), style: Theme.of(context).textTheme.headline6,),
            const SizedBox(height: 10.0),
            Text(widget.product!.description!, style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18.0)),
            const SizedBox(height: 20.0),
            _actions(),
            const SizedBox(height: 20.0),
            PrimaryButton(text: 'Añadir al carrito', onPressed: () {
              ProductsModel product = ProductsModel(
                id: widget.product!.id,
                description: widget.product!.description,
                img: widget.product!.img,
                name: widget.product!.name,
                price: widget.product!.price,
                typeProductId: widget.product!.typeProductId,
                cantidad: cantidad
              );
              DataBaseApp.instance.createCartItem(product);
            }),
            const SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buttons(),
        _addProductPrice(),
        const SizedBox()
      ],
    );
  }

  Widget _addProductPrice() {
    return cantidad == 1 ? const SizedBox() : Text(PipeWidget().formato(int.parse(priceTotal.toString())), style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25.0));
  }

  Widget _buttons() {
    return Row(
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.0),
          color: primaryColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              setState(() {
                if (cantidad > 1) {
                  cantidad = cantidad - 1;
                  priceTotal = int.parse(widget.product!.price!) * cantidad;
                }
              });
            },
            child: const SizedBox(
              height: 50.0,
              width: 50.0,
              child: Icon(
                Icons.remove,
                color: whiteColor,
              )
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Text(cantidad.toString(), style: Theme.of(context).textTheme.headline6,),
        const SizedBox(width: 10.0),
        Material(
          borderRadius: BorderRadius.circular(8.0),
          color: primaryColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              setState(() {
                cantidad = cantidad + 1;
                priceTotal = int.parse(widget.product!.price!) * cantidad;
              });
            },
            child: const SizedBox(
              height: 50.0,
              width: 50.0,
              child: Icon(
                Icons.add,
                color: whiteColor,
              )
            ),
          ),
        ),
      ],
    );
  }

}