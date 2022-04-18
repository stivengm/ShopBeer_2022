import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        leading: IconButton(
          icon: const Icon(
            Icons.menu
          ),
          onPressed: () => ZoomDrawer.of(context)!.toggle()
        ),
      ),
    );
  }
}