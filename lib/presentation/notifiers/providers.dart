import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/domain/usecase/provider/providers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_state.dart';

import 'state/todo_notifiers.dart';

final todosProvider =
    StateNotifierProvider.autoDispose<TodoNotifier, TodoState>((ref) {
  final usecase = ref.read(todoUsecaseProvider);
  return TodoNotifier(todoListUsecase: usecase)..getTodoList();
});

// final todosDetailProvider = FutureProvider.autoDispose.family(
//   (ref, int id) {
//     final usecase = ref.read(getTodoDetails);
//     return 
//   },
// );
