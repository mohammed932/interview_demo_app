part of '../cache.imports.dart';

class ProxyHostCacheEntity extends ValuCacheEntity<String> {
  ProxyHostCacheEntity([String? value]) : super("ProxyHost", value ?? "");

  @override
  String get stringValue => this.value;
}
