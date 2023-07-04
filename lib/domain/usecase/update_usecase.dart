import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/config/usecase/usecase.dart';
import 'package:riverpod_demo/domain/domain.dart';

class UpdateTodoUseCase extends UseCase<TodoEntity, UpdateParams> {
  final TodoRepositories todoRepositories;

  UpdateTodoUseCase({required this.todoRepositories});

  @override
  Future<Either<Exception, TodoEntity>> call({required UpdateParams params}) {
    return todoRepositories.updateTodo(
        id: params.id, todoEntity: params.todoEntity);
  }
}

class UpdateParams {
  final int id;
  final TodoEntity todoEntity;

  UpdateParams(this.id, this.todoEntity);
}
