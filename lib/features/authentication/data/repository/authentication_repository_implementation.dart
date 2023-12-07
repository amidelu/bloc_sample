import 'package:dartz/dartz.dart';
import 'package:diu_qr_code_scanner/core/errors/exceptions.dart';
import 'package:diu_qr_code_scanner/core/errors/failure.dart';
import 'package:diu_qr_code_scanner/core/utils/typedef.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/datasource/authentication_remote_datasource.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/repositories/authertication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDatasource);

  final AuthenticationRemoteDatasource _remoteDatasource;

  @override
  ResultFuture<Token> logIn(
      {required String officeEmail, required String password}) async {
    // Test Driven Development
    // Call the remote data source
    // Check if the method returns the proper data
    /*Check if when the remote datasource throws an exception, we return a failure
    and if it doesn't throw an exception, we return the actual expected data */

    try {
      final response = await _remoteDatasource.logIn(
          officeEmail: officeEmail, password: password);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
