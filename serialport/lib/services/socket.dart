import 'dart:convert';
import 'dart:io';

class TCP {
  static late Socket _socket;
  static Future<void> initiate() async {
    const String ip = '111.111.1.111';
    const int port = 8080;

    _socket = await Socket.connect(ip, port);
    _socket.listen((event) {
      print(utf8.decode(event));
    });
  }

  static sendData(String data) {
    _socket.add(utf8.encode(data));
  }

  static closeSocket() {
    _socket.close();
  }
}
