part of 'interceptors.imports.dart';

class AppInterceptor extends Interceptor implements BaseInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.containsKey("Accept-Language")) {
      options.headers.remove("Accept-Language");
    }
    options.headers.addAll({
      "Accept-Language": 'en',
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final Map<String, dynamic> body = NetworkUtils.parseJson(response.data);
    if (body.containsKey("reqSecureKey") || body.containsKey("SessionID")) {
      String? token = body["reqSecureKey"] ?? body["SessionID"];
      if (token?.isNotEmpty ?? false) {
        NetworkSession.updateSession(token!);
      }
    }
    if (response.data.toString().toLowerCase().contains("please login again") ||
        response.statusCode == 401) {
      throw const UnauthorizedException();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    super.onError(error, handler);
  }
}
