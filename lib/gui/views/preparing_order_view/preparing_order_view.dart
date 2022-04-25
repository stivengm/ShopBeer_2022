import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopbeer/gui/templates/zoom_drawer.dart';
import 'package:shopbeer/gui/widgets/primary_button.dart';

class PreparingOrderView extends StatefulWidget {
  const PreparingOrderView({ Key? key }) : super(key: key);

  @override
  State<PreparingOrderView> createState() => _PreparingOrderViewState();
}

class _PreparingOrderViewState extends State<PreparingOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        PrimaryButton(text: 'Regresar al inicio', onPressed: returnHome)
      ],
    );
  }

  returnHome() async {
    // await Navigator.push(
    //   context, PageTransition(
    //     type: PageTransitionType.fade,
    //     child: const PreparingOrderView()
    //   )
    // );
    await Navigator.pushAndRemoveUntil(
      context, PageTransition(
        type: PageTransitionType.fade,
        child: const ZoomDrawerApp(),
      ), (route) => false
    );
  }
}