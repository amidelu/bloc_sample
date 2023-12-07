import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:diu_qr_code_scanner/core/errors/exceptions.dart';
import 'package:diu_qr_code_scanner/core/utils/constants.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/models/token_model.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';

abstract class AuthenticationRemoteDatasource {
  Future<Token> logIn({required String officeEmail, required String password});
}

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDatasource {
  const AuthRemoteDataSrcImpl(this._client);

  final Dio _client;

  @override
  Future<Token> logIn({
    required String officeEmail,
    required String password,
  }) async {
    final response = await _client.post(
      '$kHost/auth/login',
      data: jsonEncode({'office_email': officeEmail, 'password': password}),
    );

    try {
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiException(
          message: response.data,
          statusCode: response.statusCode,
        );
      }
      return TokenModel.fromJson(response.data);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
