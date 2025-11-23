import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ecoride/core/network/dio_client.dart';

@GenerateMocks([DioClient, Dio, FlutterSecureStorage])
void main() {}
