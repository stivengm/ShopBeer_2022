import 'package:flutter/material.dart';
import 'package:shopbeer/gui/constants.dart';

class LimitedTime extends StatelessWidget {
  const LimitedTime({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Stack(
        children: [
          Image.asset('assets/resources/limited_time.jpg'),
          Positioned(
            top: 90.0,
            left: 10.0,
            child: Text("Ofertas \nlimitadas!", style: Theme.of(context).textTheme.headline6!.copyWith(color: whiteColor, fontSize: 30.0, letterSpacing: 7.0)),
          ),
        ],
      ),
    );
  }
}