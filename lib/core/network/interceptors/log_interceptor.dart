part of 'interceptors.imports.dart';

class LoggerInterceptor extends Interceptor implements BaseInterceptor {
  final ValuLocalLogger<Map<String, dynamic>> _localLogger =
      ValuLocalLogger<Map<String, dynamic>>(LoggerType.Network);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    try {
      String url = response.requestOptions.path.toString();
      String method = response.requestOptions.method.toString();
      Map<String, dynamic> requestHeaders = response.requestOptions.headers;
      Map<String, dynamic> responseHeaders = response.headers.map;
      Map<String, dynamic> requestQueryParameters =
          response.requestOptions.queryParameters;
      Map<String, dynamic> requestBody = jsonDecode(
        response.requestOptions.data ?? "{}",
        reviver: (key, value) {
          if (value == null) {
            return "NULL";
          }
          return value;
        },
      );
      Map<String, dynamic> responseBody = jsonDecode(
        response.data ?? "{}",
        reviver: (key, value) {
          if (value == null) {
            return "NULL";
          }
          return value;
        },
      );
      _localLogger.log({
        "url": url,
        "method": method,
        "request": {
          "headers": requestHeaders,
          "body": requestBody,
          "queryParameters": requestQueryParameters,
        },
        "response": {
          "headers": responseHeaders,
          "body": responseBody,
        }
      });
    } catch (e) {}
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    super.onError(error, handler);
  }
}
