import 'dart:convert';

import 'package:diu_qr_code_scanner/core/utils/typedef.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({required super.officeEmail, required super.password});

  const AuthModel.empty()
      : this(officeEmail: 'emptyOfficeEmail', password: 'emptyPassword');

  String toJson() => jsonEncode(toMap());

  DataMap toMap() {
    return {
      'officeEmail': officeEmail,
      'password': password,
    };
  }

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(jsonDecode(source) as DataMap);

  factory AuthModel.fromMap(DataMap map) {
    return AuthModel(
        officeEmail: map['officeEmail'] as String,
        password: map['password'] as String);
  }

  Auth copyWith({
    String? officeEmail,
    String? password,
    String? token,
  }) {
    return AuthModel(
        officeEmail: officeEmail ?? this.officeEmail,
        password: password ?? this.password);
  }
}
