import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/views/cart_view/cart_empy_view.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class CartView extends StatefulWidget {
  const CartView({ Key? key }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneralWidget(titleAppbar: 'Carrito de compras'),
      // body: CartEmpyView(),
      body: _body(),
    );
  }

  Widget _body() {
    Size media = MediaQuery.of(context).size;
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          ZoomDrawer.of(context)!.close();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: primaryColor,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TOTAL: ", style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0)),
                      Text("10000", style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25.0))
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: media.width * .5,
                    child: PrimaryButton(text: 'Confirmar', onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}