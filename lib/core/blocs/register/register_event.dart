part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}


class IsLoadingApp extends RegisterEvent {
  final bool? isLoading;
  const IsLoadingApp(this.isLoading);
}