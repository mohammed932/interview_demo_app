part of '../cache.imports.dart';

abstract class ValuCacheException implements Exception {
  final String message;

  ValuCacheException(this.message);

  @override
  String toString() => message;
}

class CacheNotFoundException extends ValuCacheException {
  CacheNotFoundException([String? message]) : super(message ?? "");
}
