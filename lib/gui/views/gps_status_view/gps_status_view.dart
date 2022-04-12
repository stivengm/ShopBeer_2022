import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/gps/gps_bloc.dart';
import 'package:shopbeer/gui/views/gps_status_view/gps_acces__view.dart';
import 'package:shopbeer/gui/views/home_view/home_view.dart';

class GpsStatusView extends StatelessWidget {
  const GpsStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
          ? const HomeView()
          : const GpsAccessScreen();
        },
      ),
    );
  }
}
