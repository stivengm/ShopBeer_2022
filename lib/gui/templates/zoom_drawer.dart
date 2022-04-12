import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/templates/menu_view.dart';
import 'package:shopbeer/gui/views/cart_view/cart_view.dart';
import 'package:shopbeer/gui/views/home_view/home_view.dart';

class ZoomDrawerApp extends StatefulWidget {
  const ZoomDrawerApp({ Key? key }) : super(key: key);

  @override
  State<ZoomDrawerApp> createState() => _ZoomDrawerAppState();
}

class _ZoomDrawerAppState extends State<ZoomDrawerApp> {

  MenuItemModel currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      borderRadius: 40.0,
      angle: 0.0,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * .6,
      backgroundColor: primaryColor.withOpacity(.2),
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) {
          return MenuDrawerZoomView(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }
          );
        }
      ),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeView();
      case MenuItems.cart:
        return const CartView();
      // case MenuItems.favorites:
      //   return const HomeView();
      default:
      return const HomeView();
    }
  }

}