part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class LoggingIn extends AuthenticationState {}

class LoggedIn extends AuthenticationState {
  const LoggedIn(this.token);

  final Token token;

  @override
  List<Object> get props => [token];
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
