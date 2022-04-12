import 'package:flutter/material.dart';
import 'package:shopbeer/data/models/methos_pay_model.dart';
import 'package:shopbeer/gui/constants.dart';

class MethodsPay extends StatelessWidget {
  final List<MethodsPayModel>? methodsPay;
  const MethodsPay({ Key? key, this.methodsPay }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      width: double.infinity,
      child: Column(
        children: [
          Text('Nuestros métodos de pago', style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18.0)),
          const SizedBox(height: defaultPadding / 2),
          Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            height: 85.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: methodsPay!.length,
              itemBuilder: ( BuildContext context, int index ) => Container(
                margin: const EdgeInsets.only(right: 5.0),
                width: 100.0,
                child: Image.network(methodsPay![index].img!, fit: BoxFit.contain,),
              )
            ),
          ),
        ],
      )
    );
  }

}