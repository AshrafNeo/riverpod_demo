import 'package:riverpod_demo/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepositories {
  Future<Either<Exception, List<TodoEntity>>> getTodoList();
}
