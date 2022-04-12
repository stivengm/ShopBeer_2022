import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/gui/views/cart_view/cart_empy_view.dart';

class CartView extends StatelessWidget {
  const CartView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito de compras"),
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle()
        ),
      ),
      body: const CartEmpyView(),
    );
  }
}