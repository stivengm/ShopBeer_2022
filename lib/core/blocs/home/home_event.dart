part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetMethodsPay extends HomeEvent {
  final List<MethodsPayModel>? methodsPay;
  const GetMethodsPay(this.methodsPay);
}

class SaveProductsCerveza extends HomeEvent {
  final List<ProductsModel>? productsCerveza;
  const SaveProductsCerveza(this.productsCerveza);
}

class SaveProductsAguardiente extends HomeEvent {
  final List<ProductsModel>? productsAguardiente;
  const SaveProductsAguardiente(this.productsAguardiente);
}

class SaveProductsRon extends HomeEvent {
  final List<ProductsModel>? productsRon;
  const SaveProductsRon(this.productsRon);
}

class GetProducts extends HomeEvent {
  final List<ProductsModel>? productsModel;
  const GetProducts(this.productsModel);
}

class HandleLoading extends HomeEvent {
  final bool isLoading;
  const HandleLoading(this.isLoading);
}