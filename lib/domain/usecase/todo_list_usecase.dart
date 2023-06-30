import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/config/usecase/usecase.dart';
import 'package:riverpod_demo/domain/domain.dart';

class TodoListUsecase extends UseCase<List<TodoEntity>, NoParams> {
  final TodoRepositories todoRepositories;

  TodoListUsecase({required this.todoRepositories});

  @override
  Future<Either<Exception, List<TodoEntity>>> call(
      {required NoParams params}) async {
    return await todoRepositories.getTodoList();
  }
}

class NoParams {}
