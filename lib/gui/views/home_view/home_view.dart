import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';
import 'package:shopbeer/core/blocs/location/location_bloc.dart';
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
            onPanUpdate: (value) {
              if (value.delta.dx > 0) {
                ZoomDrawer.of(context)!.toggle();
              }
              if (value.delta.dx < 0) {
                ZoomDrawer.of(context)!.close();
              }
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
                    const SizedBox(height: 20.0),
                    (state.productsCerveza!.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Cerveza',
                            products: state.productsCerveza,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20.0),
                    (state.productsAguardiente!.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Aguardiente',
                            products: state.productsAguardiente,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 20.0),
                    (state.productsRon!.isNotEmpty)
                        ? ListProductWidget(
                            titleHeader: 'Ron',
                            products: state.productsRon,
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
