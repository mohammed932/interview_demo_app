part of 'session.imports.dart';

class NetworkSession {
  String? _token;
  static NetworkSession? _instance;
  String? get token => _token;
  bool _isValid;
  bool get isValid => _isValid;
  bool _renewUnderProcess = false;
  factory NetworkSession({String? token}) =>
      _instance ??= NetworkSession._(token, true, false);
  factory NetworkSession.updateSession(String token) {
    _instance = NetworkSession._(token, true, false);
    return _instance!;
  }
  factory NetworkSession.killSession() {
    _instance = NetworkSession._(_instance?._token, false, false);
    return _instance!;
  }
  factory NetworkSession.startRenewProcess() {
    _instance =
        NetworkSession._(_instance?._token, _instance?._isValid ?? false, true);
    return _instance!;
  }
  NetworkSession._(this._token, this._isValid, this._renewUnderProcess);
  void remove() {
    _instance = NetworkSession._("dasdasdasd", true, false);
  }

  static bool underRenewProcess() => _instance?._renewUnderProcess ?? false;
  static bool sessionExists() {
    return (_instance?.isValid ?? false) && (_instance?._token != null);
  }
}
