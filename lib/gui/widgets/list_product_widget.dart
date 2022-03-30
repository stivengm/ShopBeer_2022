import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';

class ListProductWidget extends StatefulWidget {
  final String titleHeader;

  const ListProductWidget({ Key? key, required this.titleHeader }) : super(key: key);

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _item(),
                _item(),
                _item(),
                _item(),
                _item(),
                _item(),
                _item(),
                _item(),
                _item(),
              ],
              // itemCount: productsServices.productsCerveza.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _item() {
    return Container(
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
            tag: 1,
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/shop-beer.appspot.com/o/products%2Faguardiente_azul.png?alt=media&token=8ab029ff-1c20-4920-bea5-f4c8c1e6cece', fit: BoxFit.contain, height: 100.0)
          ),
          SizedBox(
            height: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Aguardiente', style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 13.0)),
                // TextApp(text: productsServices.productsCerveza[i].name, size: 13.0, font: 'Rubik', fontW: FontWeight.bold, textAlign: TextAlign.center,),
                const SizedBox(height: 5.0),
                const Text("10.000")
                // TextApp(text: "\$ ${_formato(int.parse(productsServices.productsCerveza[i].price))}", size: 12.0, font: 'Rubik', fontW: FontWeight.w500,)
              ],
            ),
          ),
        ],
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