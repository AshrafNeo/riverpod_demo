import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/domain/domain.dart';
import 'package:riverpod_demo/domain/usecase/get_todo_details_usecase.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_details_state.dart';

class TodoNotifierDetails extends StateNotifier<TodoDetailState> {
  final GetTodoDetail _getTodoDetail;

  TodoNotifierDetails({required GetTodoDetail getTodoDetail})
      : _getTodoDetail = getTodoDetail,
        super(TodoDetailInitial());

  getTodoDetails({required int id}) async {
    state = const TodoLoading(true);
    final result = await _getTodoDetail(params: DetailsParams(id));

    result.fold((l) => state = TodoError(l), (r) => state = TodoLoaded(r));
  }

  void resetState() {
    state = TodoDetailInitial();
  }

  void setCompleted(bool newCompleted, TodoEntity todoEntity) {
    state = TodoLoaded(todoEntity.setCompleted(newCompleted));
  }
}
