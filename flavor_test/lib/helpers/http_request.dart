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
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'auth token bulah';
        // Do something before request is sent
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: `handler.reject(dioError)`
      },
      // onResponse: (response, handler) {
      //   // Do something with response data
      //   return handler.next(response); // continue
      //   // If you want to reject the request with a error message,
      //   // you can reject a `DioError` object eg: `handler.reject(dioError)`
      // },
      // onError: (DioError e, handler) {
      //   // Do something with response error
      //   return handler.next(e); //continue
      //   // If you want to resolve the request with some custom data，
      //   // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // },
    ));
  }
  factory BackServer() {
    return _instance;
  }
  static Future<Response<dynamic>> get(String endPoint) {
    return _dio.get(endPoint);
  }
}
