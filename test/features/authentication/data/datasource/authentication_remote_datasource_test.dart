import 'package:dio/dio.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/datasource/authentication_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Dio {}

void main() {
  late Dio client;
  late AuthenticationRemoteDatasource datasource;

  setUp(() {
    client = MockClient();
    datasource = AuthRemoteDataSrcImpl(client);
  });

  group('logIn', () {});
}
