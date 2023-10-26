part of '../cache.imports.dart';

abstract class ValuCacheEntity<T> {
  final String key;
  final T value;
  String get stringValue;
  ValuCacheEntity(this.key, this.value);
  factory ValuCacheEntity.ofType(Type entity, String value) {
    switch (entity) {
      case SSLPinningCacheEntity:
        return SSLPinningCacheEntity(value) as ValuCacheEntity<T>;
      case ProxyCacheEntity:
        return ProxyCacheEntity(value) as ValuCacheEntity<T>;
      case ProxyPortCacheEntity:
        return ProxyPortCacheEntity(value) as ValuCacheEntity<T>;
      case ProxyHostCacheEntity:
        return ProxyHostCacheEntity(value) as ValuCacheEntity<T>;

      default:
        throw Exception("Invalid type");
    }
  }
}
