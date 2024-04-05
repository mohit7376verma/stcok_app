import 'package:dio/dio.dart';
import 'package:get/utils.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      printAll("-> [${options.method}] || ${options.uri}");

      var headerMsg = "HEADERS -> ";
      options.headers.forEach((key, v) {
        headerMsg += "$key : $v\n";
      });
      printAll(headerMsg);

      printAll('BODY ->');
      printAll(options.data);
    } catch (e) {
      e.printError;
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      print("<- [${response.statusCode}] || ${response.realUri}");

      var headerMsg = "HEADERS -> ";
      response.headers.forEach((key, v) {
        headerMsg += "$key : $v\n";
      });
      print(headerMsg);

      print('response BODY ->');
      printAll("REPONSE => "+response.data);
    } catch (e) {
      e.printError;
    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      print("-> [${err.response?.statusCode}] || ${err.requestOptions.uri}");
      print('ERR BODY ->\n${err.response?.data}');
    } catch (e) {
      e.printError;
    }

    return super.onError(err, handler);
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(print);
  }
}
