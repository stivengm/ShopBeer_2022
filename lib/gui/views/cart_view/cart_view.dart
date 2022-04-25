import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/views/cart_view/cart_empy_view.dart';
import 'package:shopbeer/gui/views/preparing_order_view/preparing_order_view.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';
import 'package:shopbeer/gui/widgets/pipe_widget.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';


class CartView extends StatefulWidget {
  const CartView({ Key? key }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<ProductsModel> products;
  bool isLoading = false;
  int total = 0;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    getItemsCart();
  }

  Future getItemsCart() async {
    setState(() {
      isLoading = true;
      total = 0;
    });

    products = await DataBaseApp.instance.readAllCartProduct();
    
    for (var item in products) {
      int totalItem = int.parse(item.price!) * item.cantidad!;
      total = total + totalItem;
    }

    setState(() => isLoading = false );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneralWidget(titleAppbar: 'Carrito de compras'),
      body: isLoading ? const LoadingAppWidget() : _body(),
    );
  }

  Widget _body() {
    return products.isEmpty ? const CartEmpyView() : _buildCart();
  }

  Widget _buildCart() {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          ZoomDrawer.of(context)!.close();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _item(products[index]);
                }
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
              child: Column(
                children: [
                  Text(isFinished.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TOTAL: ", style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0)),
                      Text(PipeWidget().formato(total), style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25.0))
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    child: SwipeableButtonView(
                      buttonText: "Desliza para confirmar",
                      buttonWidget: const SizedBox(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30.0,
                          color: primaryColor,
                        )
                      ),
                      activeColor: primaryColor,
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() => isFinished = true );
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(
                          context, PageTransition(
                            type: PageTransitionType.fade,
                            child: const PreparingOrderView()
                          )
                        );
                        setState(() => isFinished = false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(ProductsModel product) {
    int priceTotal = int.parse(product.price!) * product.cantidad!; 
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        children: [
          Image.network(product.img!, width: 140.0, height: 105.0,),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name!, style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 17.0)),
                Text("Cantidad: ${product.cantidad.toString()}"),
                Text("\$${PipeWidget().formato(priceTotal)}"),
              ],
            ),
          ),
          _actions(product.id!)
        ],
      ),
    );
  }

  Widget _actions(int id) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(50.0),
          color: dangerColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () async {
              await DataBaseApp.instance.deleteItemCart(id);
              getItemsCart();
            },
            child: const SizedBox(
              height: 40.0,
              width: 40.0,
              child: Icon(
                Icons.delete,
                color: whiteColor
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Material(
          borderRadius: BorderRadius.circular(50.0),
          color: primaryColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              // DataBaseApp.instance.createFavorite(product);
            },
            child: const SizedBox(
              height: 40.0,
              width: 40.0,
              child: Icon(
                Icons.edit,
                color: whiteColor
              ),
            ),
          ),
        ),
      ],
    );
  }

}