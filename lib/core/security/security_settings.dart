import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../cache/cache.imports.dart';

class SecuritySettingsConfig {
  static SecuritySettingsConfig? _instance;
  late ValuCacheManager _manager;
  SecuritySettingsConfig() {
    _manager = ValuSecuredCacheManager(FlutterSecureStorage());
  }
  static SecuritySettingsConfig get instatnce {
    if (_instance == null) {
      _instance = SecuritySettingsConfig();
    }
    return _instance!;
  }

  Future<void> init() async {
    try {
      _sslPinningEnabled =
          (await _manager.getValue<SSLPinningCacheEntity>()).value;
    } on CacheNotFoundException {
      try {
        _sslPinningEnabled =
            (await _manager.getValue<SSLPinningCacheEntity>()).value;
      } catch (e) {}
    } catch (e) {}
    try {
      _proxyEnabled = (await _manager.getValue<ProxyCacheEntity>()).value;
    } on CacheNotFoundException {
    } catch (e) {}

    _proxyConfig = proxyConfigurations.copyWith(
      host: (await _manager.getValue<ProxyHostCacheEntity>()).value,
      port: (await _manager.getValue<ProxyPortCacheEntity>()).value,
    );

    printStatus();
  }

  Future<void> remove() async {
    await _manager.deleteValues([
      SSLPinningCacheEntity,
      ProxyCacheEntity,
      ProxyHostCacheEntity,
      ProxyPortCacheEntity
    ]);
    _sslPinningEnabled = true;
    _proxyEnabled = false;
    _proxyConfig = ProxyConfig.noProxy();
  }

  void printStatus() {
    log("[valU Security Configurations] SSL Pinning is ${sslPinningEnabled ? 'Enabled' : 'Disabled'}");
    log("[valU Security Configurations] Proxy is ${proxyEnabled ? 'Enabled' : 'Disabled'}");
    log("[valU Security Configurations] Proxy Host: ${proxyConfigurations.host}");
    log("[valU Security Configurations] Proxy Port: ${proxyConfigurations.port}");
  }

  bool? _sslPinningEnabled;
  bool? _proxyEnabled;
  ProxyConfig? _proxyConfig;
  bool get sslPinningEnabled {
    if (_sslPinningEnabled == null) {
      _sslPinningEnabled = true;
    }
    return _sslPinningEnabled!;
  }

  bool get proxyEnabled {
    if (_proxyEnabled == null) {
      _proxyEnabled = false;
    }
    return _proxyEnabled!;
  }

  ProxyConfig get proxyConfigurations {
    if (_proxyConfig == null) {
      _proxyConfig = ProxyConfig.noProxy();
    }
    return _proxyConfig!;
  }

  void toggleSSLPinning() {
    _sslPinningEnabled = !sslPinningEnabled;
    if (sslPinningEnabled) {
      _proxyEnabled = false;
    }
    printStatus();
  }

  void toggleProxy() {
    _proxyEnabled = !proxyEnabled;
    if (proxyEnabled) {
      _sslPinningEnabled = false;
    }
    printStatus();
  }

  void changeProxy({String? host, String? port}) {
    _proxyConfig = proxyConfigurations.copyWith(host: host, port: port);
    printStatus();
  }

  Future<void> save() async {
    await _manager.cacheValue(SSLPinningCacheEntity.set(sslPinningEnabled));
    await _manager.cacheValue(ProxyCacheEntity.set(proxyEnabled));
    await _manager.cacheValue(ProxyHostCacheEntity(proxyConfigurations.host));
    await _manager.cacheValue(ProxyPortCacheEntity(proxyConfigurations.port));
  }
}

class ProxyConfig {
  final String host;
  final String port;
  ProxyConfig(this.host, this.port);
  factory ProxyConfig.noProxy() {
    return ProxyConfig("", "");
  }
  ProxyConfig copyWith({
    String? host,
    String? port,
  }) {
    return ProxyConfig(host ?? this.host, port ?? this.port);
  }

  String get proxy {
    if (host.isEmpty || port.isEmpty) {
      return "DIRECT";
    }
    return "PROXY $host:$port";
  }
}
