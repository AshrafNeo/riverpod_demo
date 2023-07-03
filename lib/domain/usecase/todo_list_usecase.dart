import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/config/usecase/usecase.dart';
import 'package:riverpod_demo/domain/domain.dart';

class TodoListUsecase extends UseCase<List<TodoEntity>, Params> {
  final TodoRepositories todoRepositories;

  TodoListUsecase({required this.todoRepositories});

  @override
  Future<Either<Exception, List<TodoEntity>>> call({required Params params}) {
    return todoRepositories.getTodoList(limit: params.limit);
  }
}

class NoParams {}

class Params {
  final int limit;

  Params({required this.limit});
}
