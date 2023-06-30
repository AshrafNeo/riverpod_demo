import 'package:dartz/dartz.dart';
import 'package:riverpod_demo/data/remote/remote.dart';
import 'package:riverpod_demo/domain/domain.dart';

class TodoRepositoriesImpl extends TodoRepositories {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoriesImpl({required this.todoRemoteDataSource});

  Future<Either<Exception, List<TodoEntity>>> _getTodoList() async {
    try {
      final todoResult = await todoRemoteDataSource.getTodoList();
      return Right(todoResult);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<TodoEntity>>> getTodoList() => _getTodoList();
}
