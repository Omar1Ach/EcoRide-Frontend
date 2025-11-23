import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/wallet_service.dart';
import 'package:ecoride/core/models/wallet.dart';
import 'package:ecoride/core/constants/api_constants.dart';
import 'package:ecoride/core/models/api_response.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WalletService walletService;
  late MockDioClient mockDioClient;
  late MockDio mockDio;

  setUp(() {
    mockDioClient = MockDioClient();
    mockDio = MockDio();
    walletService = WalletService(mockDioClient);

    when(mockDioClient.dio).thenReturn(mockDio);
  });

  group('WalletService', () {
    test('getWalletBalance returns balance on success', () async {
      // Arrange
      final balance = WalletBalance(
        userId: '1',
        balance: 100.0,
        lastUpdated: DateTime.now(),
      );

      when(mockDio.get(
        ApiConstants.walletBalance,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
        data: balance.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.walletBalance),
      ));

      // Act
      final result = await walletService.getBalance('1');

      // Assert
      expect(result, isA<Success<WalletBalance>>());
      expect((result as Success<WalletBalance>).data, balance);
      verify(mockDio.get(
        ApiConstants.walletBalance,
        queryParameters: {'userId': '1'},
      )).called(1);
    });

    test('addFunds returns updated balance on success', () async {
      // Arrange
      final request = const AddFundsRequest(
        userId: '1',
        amount: 50.0,
        paymentMethod: 'card',
      );
      final balance = WalletBalance(
        userId: '1',
        balance: 150.0,
        lastUpdated: DateTime.now(),
      );

      when(mockDio.post(
        ApiConstants.addFunds,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        data: balance.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.addFunds),
      ));

      // Act
      final result = await walletService.addFunds(request);

      // Assert
      expect(result, isA<Success<WalletBalance>>());
      expect((result as Success<WalletBalance>).data, balance);
    });
  });
}
