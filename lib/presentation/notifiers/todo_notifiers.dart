import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/domain/domain.dart';

class TodoNotifier extends StateNotifier<List<TodoEntity>> {
  final TodoListUsecase todoListUsecase;

  TodoNotifier({required this.todoListUsecase}) : super([]);

  Future<List<TodoEntity>> getTodoList() async {
    final either = await todoListUsecase(params: NoParams());
    either.fold((l) => log("$l"), (r) => log("$r"));
    return <TodoEntity>[];
  }
}
