import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/paths/app_paths.dart';
import 'package:shopbeer/core/paths/dotenv_paths.dart';
import 'package:shopbeer/core/providers/bloc_provider.dart';
import 'package:shopbeer/core/services/push_notifications_service.dart';
import 'package:shopbeer/gui/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load();
  await PushNotificationsService.initializeApp();
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
        fontFamily: 'Gordita',
        scaffoldBackgroundColor: backgroundApp,
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: routesApp(),
      initialRoute: 'gpsPermission',
    );
}
