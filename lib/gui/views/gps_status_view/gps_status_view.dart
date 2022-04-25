import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopbeer/core/blocs/gps/gps_bloc.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/on_boarding_data_base_model.dart';
import 'package:shopbeer/gui/templates/zoom_drawer.dart';
import 'package:shopbeer/gui/views/gps_status_view/gps_acces__view.dart';
import 'package:shopbeer/gui/views/on_boarding_view/on_boarding_view.dart';

class GpsStatusView extends StatefulWidget {
  const GpsStatusView({Key? key}) : super(key: key);

  @override
  State<GpsStatusView> createState() => _GpsStatusViewState();
}

class _GpsStatusViewState extends State<GpsStatusView> {
  List<OnBoardingDataBaseModel> onBoarding = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    validOnBoarding();
  }

  Future validOnBoarding() async {
    setState(() => isLoading = true);

    onBoarding = await DataBaseApp.instance.readOnBoarding();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
          ? onBoarding.isNotEmpty ? const ZoomDrawerApp() : const OnBoardingView()
          : const GpsAccessScreen();
        },
      ),
    );
  }
}
