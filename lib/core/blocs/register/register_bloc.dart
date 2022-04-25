import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<IsLoadingApp>((event, emit) {
      emit( state.copyWith( isLoading: event.isLoading ) );
    });
  }
}
