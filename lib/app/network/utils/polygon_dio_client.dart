import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_alice/alice.dart';

import '../../utils/constants.dart';
import '../../utils/pref.dart';
import 'log_interceptor.dart' as logger;

class PolygonDioClient {
  PolygonDioClient() {
    setUpOptions();
  }
  Dio _dio = Dio();

  setUpOptions() async {
    Alice alice = Alice(showNotification: kDebugMode, showInspectorOnShake: kDebugMode, darkTheme: true);

    var headerMap = <String, String>{
      "platform": Platform.isAndroid ? "android" : "ios",
      "isDebug": kDebugMode.toString(),
    };
    print(" check token : ${Prefs().token()}");
    if (Prefs().token().isNotEmpty) {
      headerMap['Authorization'] = "Bearer ${Prefs().token()}";
    }

    var baseOptions = BaseOptions(
      baseUrl: polygonBaseUrl,
      connectTimeout: const Duration(seconds: 30000),
      receiveTimeout: const Duration(seconds: 30000),
      headers: headerMap,
    );

    _dio = Dio(baseOptions);
    _dio.interceptors
      .add(logger.LogInterceptor());
      // ..add(alice.getDioInterceptor());
  }

  Dio getPolygonDioClient() {
    return _dio;
  }
}
