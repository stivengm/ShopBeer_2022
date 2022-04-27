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
    Size media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/resources/compra_completada.gif", height: media.height * .3, width: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * .1),
          child: Column(
            children: [
              Text("¡Enhorabuena!", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 23.0), textAlign: TextAlign.center),
              const SizedBox(height: 10.0),
              const Text("Estamos preparando tu pedido, en unos minutos estaremos en tu puerta entregándotelo.", textAlign: TextAlign.center),
            ],
          ),
        ),
        SizedBox(
          width: media.width * .8,
          child: PrimaryButton(text: 'Regresar al inicio', onPressed: returnHome),
        ),
        
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