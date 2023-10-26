part of '../cache.imports.dart';

enum CacheTypes { True, False }

String cacheTypeToString(CacheTypes type) {
  switch (type) {
    case CacheTypes.True:
      return "1";
    case CacheTypes.False:
      return "0";
    default:
      return "0";
  }
}

CacheTypes cacheTypeFromString(String type) {
  switch (type) {
    case "1":
      return CacheTypes.True;
    case "0":
      return CacheTypes.False;
    default:
      if (type.isEmpty)
        throw CacheNotFoundException();
      else
        return CacheTypes.False;
  }
}

String booleanToString(bool value) {
  return value ? "1" : "0";
}
