part of 'authenticator.imports.dart';

class JwtAuthenticator implements BaseAuthentication {
  /// Generates a JWT token using the generateJwtToken API.
  /// The token is used to authenticate with the ValuAuth API.
  ///
  /// The token contains the `ApplicationId` claim, which is used to authenticate
  /// the application with the ValuAuth API.
  ///
  /// The `ApplicationId` claim is a constant for each application.
  ///
  /// The `ApplicationId` claim is set in the `NetworkKeys` class.
  @override
  String key = "Authorization";

  @override
  AuthenticationSchema schema = AuthenticationSchema.bearer;

  @override
  Future<String> call({Map<String, dynamic>? args}) async {
    final Map<String, dynamic> result =
        await RemoteServiceInjector().remoteService(
      url: ValuStaticDataEndpoints.generateJwtToken(
        {
          "claimsSet": {
            "ApplicationId": NetworkKeys.jwtApplicationId(),
          }
        },
      ),
    );

    return result["accessToken"] ?? "";
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
    if (headers.containsKey(key)) {
      headers.remove(key);
    }
    headers.addAll(authObject);
  }

  @override
  String toString() {
    return 'JwtAuthenticator(key: $key, schema: $schema)';
  }
}
