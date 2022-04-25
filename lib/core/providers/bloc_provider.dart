import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/gps/gps_bloc.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';
import 'package:shopbeer/core/blocs/location/location_bloc.dart';
import 'package:shopbeer/core/blocs/login/login_bloc.dart';
import 'package:shopbeer/core/blocs/register/register_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
  BlocProvider<GpsBloc>(create: (_) => GpsBloc()),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
  BlocProvider<LocationBloc>(create: (_) => LocationBloc()),
];