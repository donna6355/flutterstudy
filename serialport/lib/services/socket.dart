import 'dart:convert';
import 'dart:io';

class TCP {
  static late Socket? _socket;
  static Future<void> initiate() async {
    const String ip = '111.111.1.111';
    const int port = 8080;
    try {
      _socket = await Socket.connect(ip, port);
    } on Exception catch (e) {
      // needs more study..
      print('error occurs : $e');
      return;
    }

    _socket?.listen(
      (event) {
        print(utf8.decode(event));
      },
      onError: (err) {
        print('error occurs in TCP :${err.toString()}');
      },
      onDone: closeSocket,
    );
  }

  static sendData(String data) {
    _socket?.add(utf8.encode(data));
  }

  static closeSocket() {
    _socket?.close();
  }
}
