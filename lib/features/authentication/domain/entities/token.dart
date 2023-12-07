// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({required this.token});

  final String token;

  @override
  List<Object> get props => [token];
}
