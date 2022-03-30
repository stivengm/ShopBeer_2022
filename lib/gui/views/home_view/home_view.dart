import 'package:flutter/material.dart';
import 'package:shopbeer/gui/widgets/list_product_widget.dart';
import 'package:shopbeer/gui/widgets/methods_pay_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('ShopBeer'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const  [
          MethodsPay(),
          // DiscountWidget()
          // _header('Cerveza'),
          ListProductWidget(titleHeader: 'Cerveza',)
        ],
      ),
    );
  }

}