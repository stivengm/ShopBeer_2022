import 'package:flutter/material.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';
import 'package:shopbeer/gui/widgets/pipe_widget.dart';

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
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _item(products[index]);
      }
    );
  }

  Widget _item(ProductsModel product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      height: 120.0,
      child: Stack(
        children: [
          Row(
            children: [
              Image.network(product.img!),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product.name!, style: Theme.of(context).textTheme.headline6),
                    Text(PipeWidget().formato(int.parse(product.price!)), style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Material(
              borderRadius: BorderRadius.circular(50.0),
              color: transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () async {
                  await DataBaseApp.instance.deleteFavorites(product.id!);
                  addFavorites();
                },
                child: const SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Icon(
                    Icons.favorite,
                    color: dangerColor
                  ),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }

}