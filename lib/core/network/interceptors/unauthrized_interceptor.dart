part of 'interceptors.imports.dart';

class UnauthorizedInterceptor extends Interceptor implements BaseInterceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    response.data = "you may please login again";
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
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print("I got interceptor error $error");
    super.onError(error, handler);
  }
}
