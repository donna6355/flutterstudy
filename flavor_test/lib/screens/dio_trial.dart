import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    var options = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = Dio(options);
    // var dio = Dio();
    try {
      var response = await dio.get('http://www.google.com');
      print(response);

      response =
          await dio.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
      print(response.data.toString());
      response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});

      //Performing multiple concurrent requests:
      var responses = await Future.wait([dio.post('/info'), dio.get('/token')]);

      //response stream
      // Response<ResponseBody> rs;
      // rs = await Dio().get<ResponseBody>(
      //   url,
      //   options: Options(
      //       responseType: ResponseType.stream), // set responseType to `stream`
      // );
      // print(rs.data.stream); //response stream

      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      }, onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      }, onError: (DioError e, handler) {
        // Do something with response error
        return handler.next(e); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
      }));
    } catch (e) {
      print(e);
    }
  }
}
