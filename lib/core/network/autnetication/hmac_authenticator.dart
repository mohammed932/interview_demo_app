part of 'authenticator.imports.dart';

class HmacAuthenticator implements BaseAuthentication {
  /// Generate a HMAC hash in base64 from the provided [args] map.
  ///
  /// [args] is a map of string to dynamic
  /// [return] is a string of the HMAC hash and base64 encoded data
  @override
  String key = "Authorization";

  @override
  AuthenticationSchema schema = AuthenticationSchema.basic;

  @override
  Future<String> call({Map<String, dynamic>? args}) async {
    if (args != null && args.isNotEmpty) {
      final data = _getHmacHashInBase64FromString(args);
      return data;
    }
    return "";
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

  /// This function takes a map, and sorts all of its keys.
  /// It then iterates through each of the values, if any of them is a map,
  /// it recursively calls itself on that map.
  /// This function is used to sort the data in the map.

  Map<String, dynamic> _sortMap(Map<String, dynamic> map) {
    Map<String, dynamic> orderedData = Map.fromEntries(
      map.entries.toList()
        ..sort(
          (a, b) {
            return a.key.compareTo(b.key);
          },
        ),
    );

    for (int i = 0; i < orderedData.length; i++) {
      if (orderedData.values.elementAt(i) is Map) {
        orderedData.update(
          orderedData.keys.elementAt(i),
          (value) => _sortMap(value),
        );
      }
    }
    return orderedData;
  }

  /// This function is used to concatinate map values into a single string.
  /// The function can be used to concatinate data from a map into a single string.
  /// map is the map that contains the data to be concatinated.
  /// data is the string that is used to hold the data from the map.
  /// i is the index of the map.
  /// The function checks if the value of the map is a map or not.
  /// If the value is not a map, then the value is added to the string.
  /// If the value is a map, then the function is called again to concatinate the map.
  /// The function then returns the string.

  String _concatinateMap(Map<String, dynamic> map) {
    String data = "";
    for (int i = 0; i < map.length; i++) {
      if (map.values.elementAt(i) is Map) {
        data += _concatinateMap(map.values.elementAt(i));
      } else {
        data += map.values.elementAt(i).toString();
      }
    }
    return data.replaceAll("null", "");
  }

  /// Creates a HMAC hash from a given string.
  ///
  /// The HMAC hash is created by concatenating the values of the given
  /// [Map] in alphabetical order, appending the salt, and then converting
  /// the result to a byte array. The byte array is then encoded using the
  /// [Hmac] class.
  ///
  /// The resulting hash is then converted to a string and returned.
  ///
  /// [data] is the [Map] to be used to create the hash.
  ///
  /// Returns the hash as a string in Base64 format.
  String _getHmacHashInBase64FromString(Map<String, dynamic> data) {
    final orderedData = _sortMap(data);
    final key = _concatinateMap(orderedData) + NetworkKeys.salt;
    final keyBytes = const Utf8Encoder().convert(NetworkKeys.hmacKey);
    final dataBytes = const Utf8Encoder().convert(key);
    final hmacHex = Hmac(sha512, keyBytes).convert(dataBytes);
    return hmacHex.toString();
  }

  @override
  String toString() {
    return 'HmacAuthenticator(key: $key, schema: $schema)';
  }
}
