part of 'interceptors.imports.dart';

class InternetConnectivityInterceptor extends Interceptor
    implements BaseInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw const NoInternetConnectionException();
    }
    super.onRequest(options, handler);
  }
}
