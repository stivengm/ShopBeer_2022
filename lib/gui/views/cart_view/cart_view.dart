import 'package:flutter/material.dart';
import 'package:shopbeer/gui/views/cart_view/cart_empy_view.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';

class CartView extends StatelessWidget {
  const CartView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarGeneralWidget(titleAppbar: 'Carrito de compras'),
      body: CartEmpyView(),
    );
  }
}