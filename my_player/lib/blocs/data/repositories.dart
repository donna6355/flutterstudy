import './providers.dart';
import './models.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepo {
  SecureStorageRepo(this._storage);
  final SharedPreferences _storage;

  Future<SecureValues> test() async {
    final Map<String, String> res = await _storage.allValues();
    print(res);
    return SecureValues.fromMap(res);
  }

  Future<void> update() async {
    _storage.writeValue(key: 'id', value: 'MACHINE_ID');
  }
}


// - repositories - receive raw data from providers then return molded raw data in models