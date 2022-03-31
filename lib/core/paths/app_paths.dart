import 'package:flutter/material.dart';
import 'package:shopbeer/gui/templates/zoom_drawer.dart';
import 'package:shopbeer/gui/views/cart_view/cart_view.dart';
import 'package:shopbeer/gui/views/login_view/login_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'home': ( _ ) => const ZoomDrawerApp(),
  'login': ( _ ) => const LoginView(),
  'cart': ( _ ) => const CartView(),
};