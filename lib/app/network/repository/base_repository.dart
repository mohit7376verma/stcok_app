import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../utils/api_handler.dart';
import '../utils/network_result.dart';

typedef JsonMapper<T> = T Function(dynamic json);

abstract class BaseRepository {
  final Dio _dioClient = Get.find(tag: "dio_client");
  final ApiHandler _apiHandler = Get.find(tag: "handler");

  Future<NetworkResult<T>> get<T>(
    String path, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    required JsonMapper<T> fromJson,
  }) async {
    try {

      // if (Prefs().token().isNotEmpty) {
      //   _dioClient.options.headers["Authorization"] = "Bearer ${Prefs().token()}";
      // }else{
      //   _dioClient.options.headers.remove("Authorization");
      // }
      final res = await _dioClient.get(
        path,
        queryParameters: query,
      );

      return _apiHandler.handleNetworkResult(response: res, fromJson: fromJson, shouldHandleUnauthorizedRequest: true);
    } catch (error) {
      return _apiHandler.handleDioException(error: error, shouldHandleUnauthorizedRequest: true);
    }
  }

  Future<NetworkResult<T>> post<T>(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    required JsonMapper<T> fromJson,
  }) async {
    try {
      // if (Prefs().token().isNotEmpty) {
      //   _dioClient.options.headers["Authorization"] = "Bearer ${Prefs().token()}";
      // }else{
      //   _dioClient.options.headers.remove("Authorization");
      // }

      final res = await _dioClient.post(path, data: body, queryParameters: query);
      return _apiHandler.handleNetworkResult(response: res, fromJson: fromJson, shouldHandleUnauthorizedRequest: true);
    } catch (error) {
      return _apiHandler.handleDioException(error: error, shouldHandleUnauthorizedRequest: true);
    }
  }
}
