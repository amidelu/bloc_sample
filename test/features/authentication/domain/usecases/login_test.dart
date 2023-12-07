import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/repositories/authertication_repository.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/usecases/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late Login usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = Login(repository);
  });

  const params = LoginParams.empty();
  test(
    'should call the [AuthRepo.Login]',
    () async {
      // Arrange
      // This function called STUB
      when(
        () => repository.logIn(
            officeEmail: any(named: 'officeEmail'),
            password: any(named: 'password')),
      ).thenAnswer((_) async => const Right(Token(token: 'alskdjfskfalskjdf')));

      // Act
      final result = await usecase(params);

      // Assert
      expect(
        result,
        equals(const Right(Void)),
      );

      verify(
        () => repository.logIn(
            officeEmail: params.officeEmail, password: params.password),
      ).called(1); // called(1) will verify this only once

      // This line is for extra security that this not called more than onece
      verifyNoMoreInteractions(repository);
    },
  );
}
