import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopbeer/data/models/methos_pay_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopbeer/data/models/products_model.dart';

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
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', '/products.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);
      final List<ProductsModel> methodsModel = jsonProductsModel.map<ProductsModel>((m) => ProductsModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( GetProducts(methodsModel) );
      // List<ProductsModel> productsCervezaList = [];
      // List<ProductsModel> productsAguardiente = [];
      // final controllerStream = StreamController<List<ProductsModel>>();
      // final suscriptionStream = controllerStream.stream.listen((event) {
      //   print('event $event');
      //   for (var item in event) {
      //     switch (item.typeProductId) {
      //       case 1:
      //         if (productsCervezaList.isNotEmpty) {
      //           productsCervezaList.add(item);
      //         } else {
      //           productsCervezaList = state.productsCerveza!.toList();
      //           productsCervezaList.add(item);
      //         }
      //         add(SaveProductsCerveza(productsCervezaList));
      //         break;
      //       case 2:
      //         if (productsAguardiente.isNotEmpty) {
      //           productsAguardiente.add(item);
      //         } else {
      //           productsAguardiente = state.productsAguardiente!.toList();
      //           productsAguardiente.add(item);
      //         }
      //         break;
      //       default:
      //     } 
      //   }
      // });
      // controllerStream.add(methodsModel);
      // add(SaveProductsAguardiente(productsAguardiente));
      // add(SaveProductsCerveza(productsCervezaList));
      add( const HandleLoading(false) );
    }
  }

  Future getMethodsPay() async {
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', '/medios_pago.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonMethodsModel = jsonDecode(response.body);
      final List<MethodsPayModel> methodsModel = jsonMethodsModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( GetMethodsPay(methodsModel) );
      getProducts();
    }
  }

}
