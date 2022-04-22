part of 'home_bloc.dart';

class HomeState extends Equatable {

  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? productsModel;
  final List<ProductsModel>? productsCerveza;
  final List<ProductsModel>? productsAguardiente;
  final bool isLoading;

  const HomeState({
    methodsPay,
    productsModel,
    productsCerveza,
    productsAguardiente,
    this.isLoading = true
  }): methodsPay = methodsPay ?? const [],
      productsCerveza = productsCerveza ?? const [],
      productsAguardiente = productsAguardiente ?? const [],
      productsModel = productsModel ?? const [];

  HomeState copyWith({
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? productsModel,
    List<ProductsModel>? productsCerveza,
    List<ProductsModel>? productsAguardiente,
    bool? isLoading,
  }) => HomeState(
    methodsPay: methodsPay ?? this.methodsPay,
    isLoading: isLoading ?? this.isLoading,
    productsModel: productsModel ?? this.productsModel,
    productsCerveza: productsCerveza ?? this.productsCerveza,
    productsAguardiente: productsAguardiente ?? this.productsAguardiente,
  );
  
  // @override
  // List<Object> get props => [ methodsPay ];

  @override
  List<Object> get props => [ isLoading ];
}

