import 'package:diu_qr_code_scanner/core/utils/typedef.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';

abstract class AuthenticationRepository {
  ResultFuture<Token> logIn(
      {required String officeEmail, required String password});
}
