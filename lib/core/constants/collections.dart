import 'package:valu_network_layer/valu_network_layer.dart';

import '../network/autnetication/authenticator.imports.dart';

class NewBoxSelectValuesCollection implements BaseUrlCollection {
  @override
  String get path => 'GetNewSelectBoxValues';

  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];
}

class NewBoxValuesCollection implements BaseUrlCollection {
  @override
  String get path => 'GetNewBoxValues';

  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];
}

class LoginCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'login';
}

class CmsCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [];

  @override
  String get path => 'new-cms';
}

class JmrCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'jmr-api';
}

class SafeLoginCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'SafeLogin';
}

class MediaCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [JwtAuthenticator()];

  @override
  String get path => 'media-server-1.1';
}

class MediaFetchCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [JwtAuthenticator()];

  @override
  String get path => 'media-server';
}

class IntegrationCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'integration';
}

class EwalletCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'EWallet';
}

class ValuEwalletCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'valUEwallet';
}

class AuthenticationCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [];

  @override
  String get path => 'auth-api';
}

class EcommerceCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'AppECommerce';
}

class ServiceCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [];

  @override
  String get path => 'Service';
}

class AppCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'App';
}

class ValuAppCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];
  @override
  String get path => 'valUApp';
}

class CustomerCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'Customer';
}

class TopGunCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications =>
      [ReqSescureKeyAuthenticator()];

  @override
  String get path => 'TopGun';
}

class AuthCollection implements BaseUrlCollection {
  @override
  List<BaseAuthentication> get authentications => [];

  @override
  String get path => 'Auth';
}
