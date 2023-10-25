part of 'authenticator.imports.dart';

class NoneAuthentication implements BaseAuthentication {
  @override
  String key = "";

  @override
  AuthenticationSchema schema = AuthenticationSchema.none;

  @override
  Future<String> call({Map<String, dynamic>? args}) async {
    return "";
  }

  @override
  Future<void> authenticate(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> body}) async {}

  @override
  String toString() {
    return 'NoneAuthentication(key: $key, schema: $schema)';
  }
}
