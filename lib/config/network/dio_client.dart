import '../interceptors/interceptors.dart';
import 'dio_config.dart';
import 'package:dio/dio.dart';

class DioClient extends DioConfig {
  late Dio dio;

  DioClient({Dio? dioOverride}) {
    dio = dioOverride ?? Dio(baseOptions);
    dio.interceptors.addAll(interceptors);
  }

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
      );

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  String get baseUrl => "https://jsonplaceholder.typicode.com/";

  @override
  List<Interceptor> get interceptors => [LoggerInterceptor()];
}
