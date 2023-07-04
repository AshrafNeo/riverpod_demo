import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/domain/usecase/provider/providers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_detail_notifiers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_state.dart';

import 'state/todo_details_state.dart';
import 'state/todo_notifiers.dart';

final todosProvider =
    StateNotifierProvider.autoDispose<TodoNotifier, TodoState>(
        name: 'TODOS PROVIDER', (ref) {
  final usecase = ref.read(todoUsecaseProvider);
  final deleteUsecase = ref.read(deleteTodoUsecaseProvider);
  final updateUsecase = ref.read(updateTodoUseCaseProvider);
  return TodoNotifier(
      todoListUsecase: usecase,
      deleteTodoUsecase: deleteUsecase,
      updateTodoUseCase: updateUsecase)
    ..getTodoList();
});

final todosDetailProvider = StateNotifierProvider.autoDispose
    .family<TodoNotifierDetails, TodoDetailState, int>(
  name: 'TODO DETAILS PROVIDER',
  (ref, int id) {
    final usecase = ref.read(getTodoDetails);
    return TodoNotifierDetails(getTodoDetail: usecase)..getTodoDetails(id: id);
  },
);
