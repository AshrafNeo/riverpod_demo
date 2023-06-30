import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_demo/data/model/todo_model.dart';

part 'todo_remote_data_source.g.dart';

@RestApi()
abstract class TodoRemoteDataSource {
  factory TodoRemoteDataSource(Dio dio, {String baseUrl}) =
      _TodoRemoteDataSource;

  @GET("todos")
  Future<List<TodoModel>> getTodoList();
}
