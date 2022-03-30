part of 'home_bloc.dart';

class HomeState extends Equatable {

  final List<MethodsPayModel>? methodsPay;

  const HomeState({
    this.methodsPay
  });

  HomeState copyWith({
    List<MethodsPayModel>? methodsPay,
  }) => HomeState(
    methodsPay: methodsPay ?? this.methodsPay
  );
  
  // @override
  // List<Object> get props => [ methodsPay ];

  @override
  List<Object> get props => [];
}

