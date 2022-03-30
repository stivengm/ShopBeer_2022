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