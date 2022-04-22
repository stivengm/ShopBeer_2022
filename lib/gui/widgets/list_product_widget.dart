import 'package:flutter/material.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/views/details_product_view/details_product_view.dart';
import 'package:shopbeer/gui/widgets/pipe_widget.dart';

class ListProductWidget extends StatefulWidget {
  final String titleHeader;
  final List<ProductsModel>? products;

  const ListProductWidget({ Key? key, required this.titleHeader, this.products }) : super(key: key);

  @override
  State<ListProductWidget> createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _header(widget.titleHeader),
          const SizedBox(height: 15.0),
          SizedBox(
            width: double.infinity,
            height: 170.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.products!.length,
              itemBuilder: (BuildContext context, int index) {
                return _item(widget.products![index]);
              }
            ),
          )
        ],
      ),
    );
  }

  Widget _item(ProductsModel? product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductView(product: product)));
      },
      child: Container(
        width: 120.0,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding)
          )
        ),
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          children: [
            Hero(
              tag: product!.id!,
              child: Image.network(product.img!, fit: BoxFit.contain, height: 100.0)
            ),
            SizedBox(
              height: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(product.name!, style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 13.0), textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: 5.0),
                  Text(PipeWidget().formato(int.parse(product.price!)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20.0),
      ),
    );
  }
}