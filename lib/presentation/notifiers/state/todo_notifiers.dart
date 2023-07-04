import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/domain/domain.dart';
import 'package:riverpod_demo/domain/usecase/delete_usecase.dart';
import 'package:riverpod_demo/domain/usecase/update_usecase.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoListUsecase todoListUsecase;
  final DeleteTodoUsecase _deleteTodoUsecase;
  final UpdateTodoUseCase _updateTodoUseCase;

  TodoNotifier(
      {required this.todoListUsecase,
      required DeleteTodoUsecase deleteTodoUsecase,
      required UpdateTodoUseCase updateTodoUseCase})
      : _deleteTodoUsecase = deleteTodoUsecase,
        _updateTodoUseCase = updateTodoUseCase,
        super(const TodoState.initial());

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

  Future<void> deleteTodo(int id) async {
    final result = await _deleteTodoUsecase(params: DeleteParams(id));
    result.fold(
      (l) {},
      (r) {
        state.todoList.removeWhere((element) => element.id == id);
        state = state.copyWith(
            isLoading: false,
            todoList: state.todoList,
            state: TodoConcreteState.loaded,
            hasData: true,
            total: state.todoList.length,
            page: state.todoList.length ~/ 10,
            message: "Deleted Successfully");
        state = state.copyWith(message: '');
      },
    );
  }

  toggleTodoComplete(int id, bool value) async {
    final index = state.todoList.indexWhere((element) => element.id == id);
    // state.todoList[index] = state.todoList[index].setCompleted(value);
    // state = state.copyWith();
    final result = await _updateTodoUseCase(
        params: UpdateParams(id, state.todoList[index].setCompleted(value)));

    result.fold((l) => {}, (todo) {
      state.todoList[index] = todo;
      state = state.copyWith();
    });
  }
}
