import 'package:riverpod_demo/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepositories {
  Future<Either<Exception, List<TodoEntity>>> getTodoList({required int limit});
  Future<Either<Exception, TodoEntity>> getTodoById({required int id});
  Future<Either<Exception, TodoEntity>> createTodo(
      {required TodoEntity todoEntity});
  Future<Either<Exception, TodoEntity>> updateTodo(
      {required int id, required TodoEntity todoEntity});
  Future<Either<Exception, void>> deleteTodo({required int id});
}
