part of '../cache.imports.dart';

class SSLPinningCacheEntity extends ValuCacheEntity<bool> {
  factory SSLPinningCacheEntity.set(bool val) {
    return SSLPinningCacheEntity(
        cacheTypeToString(val ? CacheTypes.True : CacheTypes.False));
  }

  SSLPinningCacheEntity([String? value])
      : super(
            "SSLPinning", cacheTypeFromString(value ?? "") == CacheTypes.True);

  @override
  String get stringValue => booleanToString(this.value);
}
