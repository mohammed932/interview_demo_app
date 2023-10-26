part of '../cache.imports.dart';

class ProxyPortCacheEntity extends ValuCacheEntity<String> {
  ProxyPortCacheEntity([String? value]) : super("ProxyPort", value ?? "");

  @override
  String get stringValue => this.value;
}
