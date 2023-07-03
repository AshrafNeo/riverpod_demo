import 'package:riverpod_demo/data/data.dart';

import 'todo_remote_client.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodoList({int start = 0, required int limit});

  Future<TodoModel> getTodoById({required int id});

  Future<TodoModel> createTodo({required TodoModel todo});

  Future<TodoModel> updateTodo({required int id, required TodoModel todo});

  Future<void> deleteTodo({required int id});
}

class TodoRemoteDataSourceImpl extends TodoRemoteDataSource {
  final TodoRemoteClient todoRemoteClient;

  TodoRemoteDataSourceImpl({required this.todoRemoteClient});

  @override
  Future<TodoModel> createTodo({required TodoModel todo}) async {
    try {
      return await todoRemoteClient.createTodo(todo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo({required int id}) async {
    try {
      await todoRemoteClient.deleteTodo(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> getTodoById({required int id}) async {
    try {
      return await todoRemoteClient.getTodoById(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoModel> updateTodo(
      {required int id, required TodoModel todo}) async {
    try {
      return await todoRemoteClient.updateTodo(id, todo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getTodoList(
      {int start = 0, required int limit}) async {
    try {
      return await todoRemoteClient.getTodoList(start, limit);
    } catch (e) {
      rethrow;
    }
  }
}
