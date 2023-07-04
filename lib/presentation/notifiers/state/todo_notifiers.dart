import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/domain/domain.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoListUsecase todoListUsecase;

  TodoNotifier({required this.todoListUsecase})
      : super(const TodoState.initial());

  bool get isFetching =>
      state.state != TodoConcreteState.loading &&
      state.state != TodoConcreteState.fetchingMore;

  Future<void> getTodoList() async {
    if (isFetching && state.state != TodoConcreteState.fetchedAllProducts) {
      state = state.copyWith(
          state: state.page > 0
              ? TodoConcreteState.fetchingMore
              : TodoConcreteState.loading,
          isLoading: true);

      final response = await todoListUsecase(params: Params(page: state.page));

      response.fold(
        (failure) {
          state = state.copyWith(
              state: TodoConcreteState.failure,
              isLoading: false,
              message: failure.toString());
        },
        (data) {
          final totalTodos = [...state.todoList, ...data];

          state = state.copyWith(
            isLoading: false,
            todoList: totalTodos,
            state: data.isEmpty
                ? TodoConcreteState.loaded
                : TodoConcreteState.loaded,
            message: totalTodos.isEmpty ? "No Todos found" : "",
            page: totalTodos.length ~/ 10,
            hasData: true,
            total: totalTodos.length,
          );
        },
      );
    }
  }
}
