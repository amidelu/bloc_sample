import 'dart:convert';

import 'package:diu_qr_code_scanner/features/authentication/domain/entities/token.dart';

class TokenModel extends Token {
  const TokenModel({required super.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TokenModel copyWith({
    String? token,
  }) {
    return TokenModel(
      token: token ?? this.token,
    );
  }
}
