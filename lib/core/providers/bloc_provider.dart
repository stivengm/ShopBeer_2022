import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/gps/gps_bloc.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
  BlocProvider<GpsBloc>(create: (_) => GpsBloc()),
];