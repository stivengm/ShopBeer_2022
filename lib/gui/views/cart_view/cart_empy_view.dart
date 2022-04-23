import 'package:flutter/material.dart';

class CartEmpyView extends StatelessWidget {
  const CartEmpyView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/resources/cart_empy.png", height: media.height * .4, width: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * .1),
          child: Column(
            children: [
              Text("¡Tu carrito está vacío!", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 23.0), textAlign: TextAlign.center),
              const SizedBox(height: 10.0),
              const Text("Vuelve al inicio y agrega un artículo al carrito."),
            ],
          ),
        ),
        const SizedBox()
      ],
    );
  }
}