import 'package:flutter/material.dart';
import 'package:shopbeer/gui/templates/zoom_drawer.dart';
import 'package:shopbeer/gui/views/cart_view/cart_view.dart';
import 'package:shopbeer/gui/views/details_product_view/details_product_view.dart';
import 'package:shopbeer/gui/views/gps_status_view/gps_status_view.dart';
import 'package:shopbeer/gui/views/login_view/login_view.dart';
import 'package:shopbeer/gui/views/notifications_view/notifications_view.dart';
import 'package:shopbeer/gui/views/on_boarding_view/on_boarding_view.dart';
import 'package:shopbeer/gui/views/register_view/register_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'home': ( _ ) => const ZoomDrawerApp(),
  'cart': ( _ ) => const CartView(),
  'login': ( _ ) => const LoginView(),
  'register': ( _ ) => const RegisterView(),
  'onBoarding': ( _ ) => const OnBoardingView(),
  'gpsPermission': ( _ ) => const GpsStatusView(),
  'notifications': ( _ ) => const NotificationsView(),
  'detailsProduct': ( _ ) => const DetailProductView(),
};