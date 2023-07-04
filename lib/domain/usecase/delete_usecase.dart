import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/config/usecase/usecase.dart';
import 'package:riverpod_demo/domain/domain.dart';

class DeleteTodoUsecase extends UseCase<void, DeleteParams> {
  final TodoRepositories _todoRepositories;

  DeleteTodoUsecase({required TodoRepositories todoRepositories})
      : _todoRepositories = todoRepositories;

  @override
  Future<Either<Exception, void>> call({required DeleteParams params}) async {
    return _todoRepositories.deleteTodo(id: params.id);
  }
}

class DeleteParams {
  final int id;

  DeleteParams(this.id);
}
