import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/domain/repositories/providers/providers.dart';
import 'package:riverpod_demo/domain/usecase/get_todo_details_usecase.dart';

import '../todo_list_usecase.dart';

final todoUsecaseProvider = Provider((ref) {
  final todoRepo = ref.read(todoRepositoryProvider);
  final usecase = TodoListUsecase(todoRepositories: todoRepo);
  return usecase;
});

final getTodoDetails = Provider((ref) {
  final todoRepo = ref.read(todoRepositoryProvider);
  final usecase = GetTodoDetail(todoRepositories: todoRepo);
  return usecase;
});
