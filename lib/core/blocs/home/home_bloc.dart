import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopbeer/core/paths/endpoints_path.dart';
import 'package:shopbeer/data/models/methos_pay_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopbeer/data/models/products_model.dart';
import 'package:shopbeer/gui/views/home_view/home_view_store.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super( const HomeState() ) {

    on<GetMethodsPay>((event, emit) {
      emit(state.copyWith(methodsPay: event.methodsPay));
    });
    
    on<SaveProductsCerveza>((event, emit) {
      emit(state.copyWith(productsCerveza: event.productsCerveza));
    });

    on<SaveProductsAguardiente>((event, emit) {
      emit(state.copyWith(productsAguardiente: event.productsAguardiente));
    });

    on<HandleLoading>((event, emit) {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<GetProducts>((event, emit) {
      emit(state.copyWith(productsModel: event.productsModel));
    });

  }

  Future getProducts() async {
    final _storeHome = StoreHomeView();
    var url = Uri.https(EndpointPath.endPoint, EndpointPath.products);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);
      final List<ProductsModel> methodsModel = jsonProductsModel.map<ProductsModel>((m) => ProductsModel.fromJson(Map<String, dynamic>.from(m))).toList();
      _storeHome.productsModel = methodsModel;
      add( GetProducts(methodsModel) );
      add( const HandleLoading(false) );
    }
  }

  Future getMethodsPay() async {
    var url = Uri.https(EndpointPath.endPoint, EndpointPath.mediosPay);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonMethodsModel = jsonDecode(response.body);
      final List<MethodsPayModel> methodsModel = jsonMethodsModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( GetMethodsPay(methodsModel) );
      // await getProducts();
    }
  }

}
