part of 'interceptors.imports.dart';

class CertificatePinningInterceptorImpl extends CertificatePinningInterceptor
    implements BaseInterceptor {
  CertificatePinningInterceptorImpl({super.allowedSHAFingerprints});
}

class CurlLoggerDioInterceptorImpl extends CurlLoggerDioInterceptor
    implements BaseInterceptor {
  CurlLoggerDioInterceptorImpl({
    super.printOnSuccess,
    super.convertFormData,
  });
}

class PrettyDioLoggerImpl extends PrettyDioLogger implements BaseInterceptor {
  PrettyDioLoggerImpl({super.requestBody, super.requestHeader});
}

class InterceptorUtils {
  static List<BaseInterceptor> getInterceptors() {
    const env = Environment.DEV;
    List<BaseInterceptor> interceptors = [];
    if (SecuritySettingsConfig.instatnce.sslPinningEnabled ||
        env == Environment.PROD) {
      interceptors.add(
        CertificatePinningInterceptorImpl(
          allowedSHAFingerprints: [
            NetworkKeys.sslFingerprint,
          ],
        ),
      );
    }

    if (env == Environment.DEV) {
      interceptors.addAll(
        [
          CurlLoggerDioInterceptorImpl(
            printOnSuccess: true,
            convertFormData: true,
          ),
          PrettyDioLoggerImpl(
            requestBody: true,
            requestHeader: true,
          ),
        ],
      );
    }
    interceptors.add(
      AppInterceptor(),
    );
    return interceptors;
  }
}
