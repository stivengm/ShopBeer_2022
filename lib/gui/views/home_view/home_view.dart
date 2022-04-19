import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';
import 'package:shopbeer/gui/views/home_view/modal_location.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        
        if (state.isLoading) return const LoadingAppWidget();

        return Scaffold(
          appBar: AppBar(
            title: const Text('ShopBeer'),
            leading: IconButton(
              icon: const Icon(
                Icons.menu
              ),
              onPressed: () => ZoomDrawer.of(context)!.toggle()
            ),
          ),
          body: _body(),
          floatingActionButton: floatingActionButton(),
        );
      },
    );
  }

  Widget _body() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              (state.methodsPay != null && state.methodsPay!.isNotEmpty)
                  ? MethodsPay(methodsPay: state.methodsPay)
                  : const SizedBox(),
              // DiscountWidget()
              (state.productsCerveza != null &&
                      state.productsCerveza!.isNotEmpty)
                  ? ListProductWidget(
                      titleHeader: 'Cerveza',
                      products: state.productsCerveza,
                    )
                  : const SizedBox()
            ],
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
      builder: (context) => const ModalLocation()
    )
  );

}
