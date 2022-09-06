import 'package:dio/dio.dart';

class BackServer {
  static final BackServer _instance = BackServer._();
  static late Dio _dio;

  BackServer._() {
    var options = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
    );

    // InterceptorsWrapper _defaultInterceptor() => InterceptorsWrapper(
    //       onRequest: (options, handler) {
    //         options.queryParameters['lang'] = 'ko'; // add common query params
    //         handler.next(options);
    //       },
    //     );
    // InterceptorsWrapper _authInterceptor() => InterceptorsWrapper(
    //       onRequest: (options, handler) {
    //         options.headers['Authorization'] =
    //             'auth token bulah'; // add common query params
    //         handler.next(options);
    //       },
    //     );

    // _dio = Dio(options)
    //   ..interceptors.addAll([
    //     _authInterceptor(),
    //     _defaultInterceptor(),
    //   ]);

    _dio = Dio(options)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['lang'] = 'ko'; // add common query params
          options.headers['Authorization'] =
              'auth token bulah'; // add auth header
          handler.next(options);
        },
      ));
  }
  factory BackServer() {
    return _instance;
  }
  static Future<Response<dynamic>> get(String endPoint) {
    return _dio.get(endPoint);
  }
}
