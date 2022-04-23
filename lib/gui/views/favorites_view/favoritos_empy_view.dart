import 'package:flutter/material.dart';

class FavoritosEmpyView extends StatelessWidget {
  const FavoritosEmpyView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/resources/favoritos.png', height: media.height * .4, width: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * .1),
          child: Column(
            children: [
              Text("No has elegido ningún artículo como favorito.", style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20.0), textAlign: TextAlign.center),
              const SizedBox(height: 10.0),
              const Text("Vuelve al inicio y elige un arítulo como favorito."),
            ],
          ),
        ),
        const SizedBox()
      ],
    );
  }
}