part of 'interceptors.imports.dart';

class UnauthorizedInterceptor extends Interceptor implements BaseInterceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data.toString().toLowerCase().contains("please login again")) {
      NetworkSession.killSession();
      SessionHandler.authSink.add(SessionEvent.sessionExpired);
      await for (var event in SessionHandler.onAuthenticationStatusChanged) {
        if (event == SessionEvent.sessionRenewed) {
          break;
        }
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    super.onError(error, handler);
  }
}
