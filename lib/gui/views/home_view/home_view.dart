import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';
import 'package:shopbeer/core/blocs/location/location_bloc.dart';
import 'package:shopbeer/gui/views/home_view/home_view_store.dart';
import 'package:shopbeer/gui/views/home_view/modal_location.dart';
import 'package:shopbeer/gui/widgets/appbar_general_widget.dart';
import 'package:shopbeer/gui/widgets/list_product_widget.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';
import 'package:shopbeer/gui/widgets/methods_pay_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _store = StoreHomeView();
  @override
  void initState() {
    super.initState();
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.getCurrentPosition();
    getProductsAndMethodsPay();
  }

  Future getProductsAndMethodsPay() async {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    await homeBloc.getMethodsPay();
    await homeBloc.getProducts();
    _store.productsCerveza = [];
    _store.productsAguardiente = [];
    _store.productsRon = [];
    for (var item in _store.productsModel) {
      switch (item.typeProductId) {
        case 1:
          _store.productsCerveza.add(item);
          break;
        case 2:
          _store.productsAguardiente.add(item);
          break;
        case 3:
          _store.productsRon.add(item);
          break;
        default:
      } 
    }
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        
        if (state.isLoading) return const LoadingAppWidget();

        return Scaffold(
          appBar: const AppBarGeneralWidget(titleAppbar: 'ShopBeer', fontFamily: 'Curved', fontSize: 30.0,),
          body: _body(),
          floatingActionButton: floatingActionButton(),
        );
      },
    );
  }

  Widget _body() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          child: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.close();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    (state.methodsPay != null && state.methodsPay!.isNotEmpty)
                        ? MethodsPay(methodsPay: state.methodsPay)
                        : const SizedBox(),
                    // DiscountWidget()
                    // const LimitedTime(),
                    (_store.productsCerveza.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Cerveza',
                            products: _store.productsCerveza,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20.0),
                    (_store.productsAguardiente.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Aguardiente',
                            products: _store.productsAguardiente,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20.0),
                    (_store.productsRon.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Ron',
                            products: _store.productsRon,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20.0)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  FloatingActionButton floatingActionButton() => FloatingActionButton(
    child: const Icon(
      Icons.location_on_outlined
    ),
    onPressed: () => showCupertinoModalBottomSheet(
      context: context,
      isDismissible: false,
      bounce: false,
      duration: const Duration(milliseconds: 1400),
      animationCurve: Curves.elasticOut,
      builder: (context) => const ModalLocation()
    )
  );

}
