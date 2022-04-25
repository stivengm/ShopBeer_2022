part of 'home_bloc.dart';

class HomeState extends Equatable {

  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? productsModel;
  final List<ProductsModel>? productsCerveza;
  final List<ProductsModel>? productsAguardiente;
  final List<ProductsModel>? productsRon;
  final bool isLoading;

  const HomeState({
    methodsPay,
    productsModel,
    productsCerveza,
    productsAguardiente,
    productsRon,
    this.isLoading = true
  }): methodsPay = methodsPay ?? const [],
      productsCerveza = productsCerveza ?? const [],
      productsAguardiente = productsAguardiente ?? const [],
      productsRon = productsRon ?? const [],
      productsModel = productsModel ?? const [];

  HomeState copyWith({
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? productsModel,
    List<ProductsModel>? productsCerveza,
    List<ProductsModel>? productsAguardiente,
    List<ProductsModel>? productsRon,
    bool? isLoading,
  }) => HomeState(
    methodsPay: methodsPay ?? this.methodsPay,
    isLoading: isLoading ?? this.isLoading,
    productsModel: productsModel ?? this.productsModel,
    productsCerveza: productsCerveza ?? this.productsCerveza,
    productsAguardiente: productsAguardiente ?? this.productsAguardiente,
    productsRon: productsRon ?? this.productsRon,
  );
  
  // @override
  // List<Object> get props => [ methodsPay ];

  @override
  List<Object?> get props => [ 
    isLoading, 
    productsModel, 
    productsCerveza,
    productsAguardiente,
    productsRon
  ];
}

