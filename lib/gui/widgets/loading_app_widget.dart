import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';

class LoadingAppWidget extends StatelessWidget {
  const LoadingAppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );
  }
}