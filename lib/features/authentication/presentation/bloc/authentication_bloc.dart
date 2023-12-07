import 'package:bloc/bloc.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/models/token_model.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required Login
          login}) // private constructor can't be used as constructor value, so using this option
      : _logIn =
            login, // Initializing private properties by constructor properties
        super(AuthenticationInitial()) {
    on<LoginEvent>(_logInHandler);
  }

  final Login _logIn;

  Future<void> _logInHandler(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LoggingIn());

    final result = await _logIn(LoginParams(
      officeEmail: event.officeEmail,
      password: event.password,
    ));

    result.fold((failure) => emit(AuthenticationError(failure.errorMessage)),
        (token) => emit(LoggedIn(token)));
  }
}
