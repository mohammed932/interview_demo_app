part of 'cache.imports.dart';

class ValuSecuredCacheManager implements ValuCacheManager {
  final FlutterSecureStorage _secureStorage;
  ValuSecuredCacheManager(this._secureStorage);
  static IOSOptions get _iosOptions => const IOSOptions(
        accessibility: KeychainAccessibility.unlocked_this_device,
        accountName: "Valu",
      );
  static AndroidOptions get _androidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: "Valu",
        keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding,
      );
  @override
  Future<bool> cacheValue(ValuCacheEntity value) async {
    try {
      await _secureStorage.write(
        key: value.key,
        value: value.stringValue,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> getAllLogValues() async {
    Map<String, dynamic> map = await _secureStorage.readAll(
      iOptions: _iosOptions,
      aOptions: _androidOptions,
    );
    return map;
  }

  @override
  Future<bool> deleteAll() async {
    try {
      await _secureStorage.deleteAll(
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteValues(List<Type> values) async {
    try {
      List<ValuCacheEntity> entities =
          values.map((e) => ValuCacheEntity.ofType(e, "INIT")).toList();
      for (ValuCacheEntity entity in entities) {
        await _secureStorage.delete(
          key: entity.key,
          iOptions: _iosOptions,
          aOptions: _androidOptions,
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<T> getValue<T extends ValuCacheEntity>() async {
    String? val = await _secureStorage.read(
          key: ValuCacheEntity.ofType(T, "INIT").key,
          iOptions: _iosOptions,
          aOptions: _androidOptions,
        ) ??
        "";
    return ValuCacheEntity.ofType(T, val) as T;
  }
}
