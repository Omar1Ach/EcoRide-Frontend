import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/wallet_service.dart';
import 'package:ecoride/core/models/wallet.dart';
import 'package:ecoride/core/constants/api_constants.dart';
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
    test('getBalance returns success', () async {
      final walletBalance = WalletBalance(balance: 100.0, currency: 'USD');
      
      when(mockDio.get(
        ApiConstants.walletBalance,
        queryParameters: {'userId': 'user123'},
      )).thenAnswer((_) async => Response(
        data: walletBalance.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.walletBalance),
      ));

      final result = await walletService.getBalance('user123');

      expect(result.isSuccess, true);
      expect(result.data?.balance, 100.0);
    });

    test('addFunds returns success', () async {
      final request = AddFundsRequest(amount: 50.0, paymentMethodId: 'pm_123');
      final walletBalance = WalletBalance(balance: 150.0, currency: 'USD');

      when(mockDio.post(
        ApiConstants.addFunds,
        data: request.toJson(),
      )).thenAnswer((_) async => Response(
        data: walletBalance.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.addFunds),
      ));

      final result = await walletService.addFunds(request);

      expect(result.isSuccess, true);
      expect(result.data?.balance, 150.0);
    });
  });
}
