// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diu_qr_code_scanner/core/utils/typedef.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/repositories/authertication_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:diu_qr_code_scanner/core/usecase/usecase.dart';

class Login extends UsecaseWithParams<Token, LoginParams> {
  Login(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<Token> call(LoginParams params) async => _repository.logIn(
        officeEmail: params.officeEmail,
        password: params.password,
      );
}

class LoginParams extends Equatable {
  final String officeEmail;
  final String password;

  const LoginParams({
    required this.officeEmail,
    required this.password,
  });

  const LoginParams.empty()
      : this(officeEmail: 'empty.String', password: 'empty.String');

  @override
  List<Object> get props => [officeEmail, password];
}
