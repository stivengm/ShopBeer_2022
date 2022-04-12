import 'package:flutter/material.dart';

class CartEmpyView extends StatelessWidget {
  const CartEmpyView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC07DF3),
      child: Column(
        children: [
          Image.asset("assets/resources/cart_empy.jpg")
        ],
      ),
    );
  }
}