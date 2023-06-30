import 'package:dio/dio.dart';

abstract class DioConfig {
  String get baseUrl;
  Map<String, String> get headers;
  List<Interceptor> get interceptors;
}
