import 'dart:convert';
import 'dart:io';

class SocketHelper {
  //send and receive string
  Future<void> connect() async {
    Socket socket = await Socket.connect('192.168.1.99', 1024);
    print('connected');

    // listen to the received data event stream
    socket.listen((List<int> event) {
      print(utf8.decode(event));
    });

    // send hello
    socket.add(utf8.encode('hello'));

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));

    // .. and close the socket
    socket.close();
  }
}
