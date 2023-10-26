part of '../cache.imports.dart';

class ProxyCacheEntity extends ValuCacheEntity<bool> {
  factory ProxyCacheEntity.set(bool val) {
    return ProxyCacheEntity(
        cacheTypeToString(val ? CacheTypes.True : CacheTypes.False));
  }

  ProxyCacheEntity([String? value])
      : super("Proxy", cacheTypeFromString(value ?? "") == CacheTypes.True);

  @override
  String get stringValue => booleanToString(this.value);
}
