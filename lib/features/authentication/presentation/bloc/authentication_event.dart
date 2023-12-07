part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  const LoginEvent({required this.officeEmail, required this.password});

  final String officeEmail;
  final String password;

  @override
  List<Object> get props => [officeEmail, password];
}
