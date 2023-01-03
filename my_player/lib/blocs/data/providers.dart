import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum secureKeys {
  id,
  host,
  port;
}

class SharedPreferences {
  SharedPreferences(this._storage);
  final FlutterSecureStorage _storage;

//     AndroidOptions _getAndroidOptions() => const AndroidOptions(
//         encryptedSharedPreferences: true,
//       );
// final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  Future<String?> readValue(String key) async => await _storage.read(key: key);
  Future<void> writeValue({required String key, required String value}) async =>
      await _storage.write(key: key, value: value);

  Future<Map<String, String>> allValues() async => await _storage.readAll();
}


// - providers - communicate with server and return raw data