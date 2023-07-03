import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/config/usecase/usecase.dart';
import 'package:riverpod_demo/domain/domain.dart';

class GetTodoDetail extends UseCase<TodoEntity, DetailsParams> {
  final TodoRepositories todoRepositories;

  GetTodoDetail({required this.todoRepositories});

  @override
  Future<Either<Exception, TodoEntity>> call({required DetailsParams params}) {
    return todoRepositories.getTodoById(id: params.id);
  }
}

class DetailsParams {
  final int id;

  DetailsParams(this.id);
}
