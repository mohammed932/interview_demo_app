part of 'domains.imports.dart';

class Aggregator implements BaseDomain {
  final env = Environment.DEV;
  @override
  String get url => env == Environment.PROD
      ? 'https://mobagg.valu.com.eg'
      : 'https://mobagg1.valu.com.eg';
}
