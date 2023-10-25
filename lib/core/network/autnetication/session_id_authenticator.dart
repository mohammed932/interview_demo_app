part of 'authenticator.imports.dart';

class SessionIdAuthenticator implements BaseAuthentication {
  /// Retrieves the token from the network session. If there is no token,
  /// returns an empty string.
  @override
  String key = "SessionID";

  @override
  AuthenticationSchema schema = AuthenticationSchema.post;

  @override
  Future<String> call({Map<String, dynamic>? args}) async {
    return NetworkSession().token ?? "";
  }

  /// Generates an authentication token and adds it to the headers or body of an
  /// HTTP request.
  ///
  /// If the authentication type is [AuthentictionType.none], or if the
  /// [type.authenticator] is null, this method returns without doing anything.
  ///
  /// Otherwise, this method uses the [type.authenticator] to generate an
  /// authentication token, and then adds that token to either the headers or
  /// body of the request. The location of the token depends on the schema of
  /// the authentication type.
  ///
  /// The [headers] and [body] parameters are modified to include the
  /// authentication token.
  @override
  Future<void> authenticate(
      {required Map<String, dynamic> headers,
      required Map<String, dynamic> body}) async {
    String token = await call(args: body);
    Map<String, String> authObject = {
      key: "${schema.name}${schema.name.isNotEmpty ? ' ' : ''}$token"
    };
    if (body.containsKey(key)) {
      body.remove(key);
    }
    headers.addAll(authObject);
  }

  @override
  String toString() {
    return 'SessionIdAuthenticator(key: $key, schema: $schema)';
  }
}
