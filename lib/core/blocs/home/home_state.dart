part of 'home_bloc.dart';

class HomeState extends Equatable {

  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? productsModel;
  final List<ProductsModel>? productsCerveza;
  final bool isLoading;

  const HomeState({
    methodsPay,
    productsModel,
    productsCerveza,
    this.isLoading = true
  }): methodsPay = methodsPay ?? const [],
      productsCerveza = productsCerveza ?? const [],
      productsModel = productsModel ?? const [];

  HomeState copyWith({
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? productsModel,
    List<ProductsModel>? productsCerveza,
    bool? isLoading,
  }) => HomeState(
    methodsPay: methodsPay ?? this.methodsPay,
    isLoading: isLoading ?? this.isLoading,
    productsModel: productsModel ?? this.productsModel,
    productsCerveza: productsCerveza ?? this.productsCerveza
  );
  
  // @override
  // List<Object> get props => [ methodsPay ];

  @override
  List<Object> get props => [ isLoading ];
}

