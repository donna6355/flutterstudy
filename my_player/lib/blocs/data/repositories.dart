import './providers.dart';
import './models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepo {
  SecureStorageRepo(this._storage);
  final SharedPreferences _storage;

  Future<SecureValues> test() async {
    final Map<String, String> res = await _storage.allValues();
    print(res);
    return SecureValues(
      id: res['id'] ?? '',
      port: res['port'] ?? '',
      host: res['host'] ?? '',
    );
  }
}


// - repositories - receive raw data from providers then return molded raw data in models