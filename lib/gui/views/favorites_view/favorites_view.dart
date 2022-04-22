import 'package:flutter/material.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({ Key? key }) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late List<ProductsModel> products;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    addFavorites();
  }

  Future addFavorites() async {
    setState(() => isLoading = true);

    products = await DataBaseApp.instance.readAllFavorites();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGeneralWidget(titleAppbar: 'Favoritos'),
      body: isLoading ? const LoadingAppWidget() : _body(),
    );
  }

  Widget _body() {
    return products.isEmpty ? _noItemsFavorites() : _buildFavorites();
  }

  Widget _noItemsFavorites() {
    return Column(
      children: [
        Text("No hay productos")
      ],
    );
  }

  Widget _buildFavorites() {
    return Column();
  }

}