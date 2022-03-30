import 'package:flutter/material.dart';
import 'package:shopbeer/core/paths/app_paths.dart';
import 'package:shopbeer/gui/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopBeer',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundApp,
        primarySwatch: Colors.blue,
      ),
      routes: routesApp(),
      initialRoute: 'home',
    );
  }
}
