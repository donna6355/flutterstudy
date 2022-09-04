import 'package:flutter/material.dart';
import '../helpers/http_request.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioTrial extends StatefulWidget {
  const DioTrial({Key? key}) : super(key: key);

  @override
  State<DioTrial> createState() => _DioTrialState();
}

class _DioTrialState extends State<DioTrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DIO TRIAL')),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              getHttp();
            },
            child: const Text('click to req'))
      ]),
    );
  }

  void getHttp() async {
//     var dio = Dio(); // with default Options

// // Set default configs
//     dio.options.baseUrl = 'https://www.xx.com/api';
//     dio.options.connectTimeout = 5000; //5s
//     dio.options.receiveTimeout = 3000;

// or new Dio with a BaseOptions instance.
    try {
      var response = BackServer.get('sdlkfjlsdf');

      const storage = FlutterSecureStorage();
      storage.write(key: 'response ', value: response.toString());
    } catch (e) {
      print(e);
    }
  }
}
