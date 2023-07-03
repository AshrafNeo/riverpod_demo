import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/data/data.dart';
import 'package:riverpod_demo/data/datasources/remote/remote.dart';

import 'package:riverpod_demo/domain/domain.dart';

class TodoRepositoriesImpl extends TodoRepositories {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoriesImpl({required this.todoRemoteDataSource});

  @override
  Future<Either<Exception, List<TodoEntity>>> getTodoList(
          {required int limit}) =>
      _getTodoList(limit);

  @override
  Future<Either<Exception, TodoEntity>> getTodoById({required int id}) =>
      _getTodoDetails(id: id);

  @override
  Future<Either<Exception, TodoEntity>> createTodo(
          {required TodoEntity todoEntity}) =>
      _createTodo(todoEntity: todoEntity);

  @override
  Future<Either<Exception, void>> deleteTodo({required int id}) =>
      _deleteTodo(id: id);

  @override
  Future<Either<Exception, TodoEntity>> updateTodo(
          {required int id, required TodoEntity todoEntity}) =>
      _updateTodo(id: id, todoEntity: todoEntity);

  Future<Either<Exception, List<TodoEntity>>> _getTodoList(int limit) async {
    try {
      final todoResult = await todoRemoteDataSource.getTodoList(limit: limit);
      return Right(todoResult);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, TodoEntity>> _getTodoDetails(
      {required int id}) async {
    try {
      final todoResult = await todoRemoteDataSource.getTodoById(id: id);
      return Right(todoResult);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, TodoEntity>> _createTodo(
      {required TodoEntity todoEntity}) async {
    try {
      final todoResult = await todoRemoteDataSource.createTodo(
          todo: TodoModel.fromEntity(todoEntity));
      return Right(todoResult);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, void>> _deleteTodo({required int id}) async {
    try {
      final result = await todoRemoteDataSource.deleteTodo(id: id);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, TodoEntity>> _updateTodo(
      {required int id, required TodoEntity todoEntity}) async {
    try {
      final result = await todoRemoteDataSource.updateTodo(
          id: id, todo: TodoModel.fromEntity(todoEntity));
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
