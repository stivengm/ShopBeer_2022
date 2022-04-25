part of 'register_bloc.dart';


class RegisterState extends Equatable {
  final bool? isLoading;

  const RegisterState({
    this.isLoading = false
  });

  RegisterState copyWith({
    bool? isLoading,
  }) => RegisterState(
    isLoading: isLoading ?? this.isLoading
  );
  
  @override
  List<Object?> get props => [ isLoading ];
}
