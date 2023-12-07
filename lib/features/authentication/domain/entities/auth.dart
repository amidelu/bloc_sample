// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  const Auth({required this.officeEmail, required this.password});

  const Auth.empty()
      : this(
          officeEmail: 'empty.officeEmail',
          password: 'empty.password',
        );

  final String officeEmail;
  final String password;

  @override
  List<Object?> get props => [officeEmail, password];
}
