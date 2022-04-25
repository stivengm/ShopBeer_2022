import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopbeer/data/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super( const LoginState()) {
    on<InfoUser>((event, emit) {
      emit( state.copyWith(user: event.user) );
    });

    on<IsLogguedUser>((event, emit) {
      emit( state.copyWith(isLogued: event.isLogued) );
    });
  }
}
