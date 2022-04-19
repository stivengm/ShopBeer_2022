import 'package:flutter/material.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarGeneralWidget(titleAppbar: 'Favoritos'),
    );
  }
}