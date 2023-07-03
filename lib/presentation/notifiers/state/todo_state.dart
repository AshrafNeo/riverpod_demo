// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:riverpod_demo/domain/domain.dart';

enum TodoConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllProducts
}

class TodoState extends Equatable {
  final List<TodoEntity> todoList;
  final int total;
  final int page;
  final bool hasData;
  final TodoConcreteState state;
  final String message;
  final bool isLoading;

  const TodoState({
    this.todoList = const [],
    this.total = 0,
    this.page = 0,
    this.hasData = false,
    this.state = TodoConcreteState.initial,
    this.message = '',
    this.isLoading = false,
  });

  const TodoState.initial({
    this.todoList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = TodoConcreteState.initial,
    this.message = '',
  });

  TodoState copyWith({
    List<TodoEntity>? todoList,
    int? total,
    int? page,
    bool? hasData,
    TodoConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props {
    return [
      todoList,
      total,
      page,
      hasData,
      state,
      message,
      isLoading,
    ];
  }

  @override
  bool get stringify => true;
}
