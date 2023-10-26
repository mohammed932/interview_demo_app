part of 'cache.imports.dart';

abstract class ValuCacheManager {
  Future<bool> cacheValue(ValuCacheEntity value);
  Future<T> getValue<T extends ValuCacheEntity>();
  Future<Map<String, dynamic>> getAllLogValues();
  Future<bool> deleteValues(List<Type> values);
  Future<bool> deleteAll();
}
