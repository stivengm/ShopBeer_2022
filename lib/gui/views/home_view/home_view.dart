import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopbeer/core/blocs/home/home_bloc.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/gui/widgets/limited_time_widget.dart';
import 'package:shopbeer/gui/widgets/list_product_widget.dart';
import 'package:shopbeer/gui/widgets/loading_app_widget.dart';
import 'package:shopbeer/gui/widgets/methods_pay_widget.dart';

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
              icon: SvgPicture.asset('assets/icons/menu.svg', color: whiteColor,),
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
              const LimitedTime(),
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
    onPressed: () {}
  );

}
