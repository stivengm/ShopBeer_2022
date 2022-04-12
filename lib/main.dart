import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/paths/app_paths.dart';
import 'package:shopbeer/core/providers/bloc_provider.dart';
import 'package:shopbeer/gui/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providerBloc,
      child: mateApp()
    );
  }

  MaterialApp mateApp() => MaterialApp(
      title: 'ShopBeer',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundApp,
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: routesApp(),
      initialRoute: 'gpsPermission',
    );
}
