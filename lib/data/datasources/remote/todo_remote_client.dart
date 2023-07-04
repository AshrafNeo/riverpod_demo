import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_demo/data/data.dart';

part 'todo_remote_client.g.dart';

@RestApi()
abstract class TodoRemoteClient {
  factory TodoRemoteClient(Dio dio, {String baseUrl}) = _TodoRemoteClient;

  @GET("todos")
  Future<List<TodoModel>> getTodoList(
      @Query("_page") int id, @Query("_limit") int limit);

  @GET("/todos/{id}")
  Future<TodoModel> getTodoById(@Path("id") int id);

  @POST("/todos")
  Future<TodoModel> createTodo(@Body() TodoModel todo);

  @PUT("/todos/{id}")
  Future<TodoModel> updateTodo(
    @Path("id") int id,
    @Body() TodoModel todo,
  );

  @DELETE("/todos/{id}")
  Future<void> deleteTodo(
    @Path("id") int id,
  );
}
