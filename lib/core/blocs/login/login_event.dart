part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// class InfoUser extends LoginEvent {
//   final UserModel? user;
//   const InfoUser(this.user);
// }

class IsLogguedUser extends LoginEvent {
  final bool isLogued;
  const IsLogguedUser(this.isLogued);
}