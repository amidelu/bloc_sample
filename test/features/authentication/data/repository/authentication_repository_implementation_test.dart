import 'package:dartz/dartz.dart';
import 'package:diu_qr_code_scanner/core/errors/exceptions.dart';
import 'package:diu_qr_code_scanner/core/errors/failure.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/datasource/authentication_remote_datasource.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock
    implements AuthenticationRemoteDatasource {}

void main() {
  late AuthenticationRemoteDatasource remoteDatasource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    remoteDatasource = MockRemoteDataSource();
    repoImpl = AuthenticationRepositoryImplementation(remoteDatasource);
  });

  const tException = ApiException(message: 'Something bad happened', statusCode: 500);

  group('logIn', () {
    const officeEmail = 'amidelu';
    const password = 'password';

    test(
        'should call [RemoteDataSource.logIn] successfully and return correct data',
        () async {
      // Arrange
      when(
        () => remoteDatasource.logIn(
            officeEmail: any(named: 'officeEmail'),
            password: any(named: 'password')),
      ).thenAnswer((_) async => Future.value());

      // Act
      final result = await repoImpl.logIn(officeEmail: officeEmail, password: password);

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => remoteDatasource.logIn(
          officeEmail: officeEmail, password: password)).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });

    test('should throw [ServerException]', () async {
      // Arrange
      when(
        () => remoteDatasource.logIn(
            officeEmail: any(named: 'officeEmail'),
            password: any(named: 'password')),
      ).thenThrow(tException);

      // Act
      final result =
          await repoImpl.logIn(officeEmail: officeEmail, password: password);

      // Assert
      expect(
          result,
          equals(Left(ApiFailure(
              message: tException.message,
              statusCode: tException.statusCode))));
      verify(() => remoteDatasource.logIn(
          officeEmail: officeEmail, password: password)).called(1);
      verifyNoMoreInteractions(remoteDatasource);
    });
  });
}
