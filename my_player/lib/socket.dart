import 'dart:io';

class TCP {
  Socket? clientSocket;

  Future<void> init() async {
    try {
      await Socket.connect('1234', 5252)
          .then((socket) => clientSocket = socket);
      clientSocket?.listen((event) {
        print(event);
      });
    } catch (e) {
      print(e);
    }
  }

  void sendMsg(String msg) {
    clientSocket?.write('hello');
  }
}
