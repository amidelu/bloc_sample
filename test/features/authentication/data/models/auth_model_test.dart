import 'package:diu_qr_code_scanner/features/authentication/data/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthModel', () {
    test('toJson method should return a valid JSON string', () {
      const authModel = AuthModel(
        officeEmail: 'test@example.com',
        password: 'password123',
      );

      expect(authModel.toJson(),
          '{"officeEmail":"test@example.com","password":"password123","token":"exampleToken"}');
    });

    test('fromJson method should return a valid AuthModel object', () {
      const jsonString =
          '{"officeEmail":"test@example.com","password":"password123","token":"exampleToken"}';
      final authModel = AuthModel.fromJson(jsonString);

      expect(authModel.officeEmail, 'test@example.com');
      expect(authModel.password, 'password123');
    });

    test(
        'copyWith method should create a new AuthModel object with updated values',
        () {
      const authModel = AuthModel(
        officeEmail: 'test@example.com',
        password: 'password123',
      );

      final updatedAuthModel = authModel.copyWith(
        officeEmail: 'updated@example.com',
        password: 'updatedPassword123',
        token: 'updatedToken',
      );

      expect(updatedAuthModel.officeEmail, 'updated@example.com');
      expect(updatedAuthModel.password, 'updatedPassword123');
    });

    test(
        'AuthModel.empty() should create an AuthModel object with default values',
        () {
      const emptyAuthModel = AuthModel.empty();

      expect(emptyAuthModel.officeEmail, 'emptyOfficeEmail');
      expect(emptyAuthModel.password, 'emptyPassword');
    });
  });
}
