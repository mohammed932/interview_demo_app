part of 'domains.imports.dart';

class Gateway implements BaseDomain {
  final env = Environment.DEV;
  @override
  String get url => env == Environment.PROD
      ? 'https://mobservices.valu.com.eg'
      : 'https://mobservices1.valu.com.eg';
}
