import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/wallet.dart';
import '../models/api_response.dart';

class WalletService {
  final DioClient _dioClient;

  WalletService(this._dioClient);

  Future<ApiResponse<WalletBalance>> getBalance(String userId) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.walletBalance,
        queryParameters: {'userId': userId},
      );

      return ApiResponse.success(
        data: WalletBalance.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get wallet balance',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<WalletBalance>> addFunds(
    AddFundsRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.addFunds,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: WalletBalance.fromJson(response.data),
        message: 'Funds added successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to add funds',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<List<WalletTransaction>>> getTransactionHistory(
    TransactionHistoryRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.transactions,
        queryParameters: request.toQueryParameters(),
      );

      final transactions = (response.data['items'] as List)
          .map((json) => WalletTransaction.fromJson(json))
          .toList();

      return ApiResponse.success(data: transactions);
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get transaction history',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
