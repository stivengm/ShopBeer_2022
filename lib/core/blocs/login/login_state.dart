part of 'login_bloc.dart';

class LoginState extends Equatable {

  // final UserModel? user;
  final bool isLogued;
  final bool isLoading;

  const LoginState({
    // this.user,
    this.isLogued = false,
    this.isLoading = false
  });

  LoginState copyWith({
    // UserModel? user,
    bool? isLogued,
    bool? isLoading
  }) => LoginState(
    // user: user ?? this.user,
    isLogued: isLogued ?? this.isLogued,
    isLoading: isLoading ?? this.isLoading
  );
  
  @override
  List<Object> get props => [ isLogued, isLoading ];
}

class LoginInitial extends LoginState {}
