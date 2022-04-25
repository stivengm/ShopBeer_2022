part of 'login_bloc.dart';

class LoginState extends Equatable {

  // final UserModel? user;
  final bool isLogued;

  const LoginState({
    // this.user,
    this.isLogued = false,
  });

  LoginState copyWith({
    // UserModel? user,
    bool? isLogued
  }) => LoginState(
    // user: user ?? this.user,
    isLogued: isLogued ?? this.isLogued
  );
  
  @override
  List<Object> get props => [ isLogued ];
}

class LoginInitial extends LoginState {}
