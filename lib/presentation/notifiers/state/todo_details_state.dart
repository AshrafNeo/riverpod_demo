// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:riverpod_demo/domain/domain.dart';

sealed class TodoDetailState extends Equatable {
  const TodoDetailState();

  @override
  List<Object> get props => [];
}

class TodoDetailInitial extends TodoDetailState {}

class TodoLoading extends TodoDetailState {
  final bool isLoading;

  const TodoLoading(this.isLoading);

  TodoLoading copyWith({
    bool? isLoading,
  }) {
    return TodoLoading(
      isLoading ?? this.isLoading,
    );
  }
}

class TodoLoaded extends TodoDetailState {
  final TodoEntity todoEntity;

  const TodoLoaded(this.todoEntity);

  @override
  List<Object> get props => [todoEntity];

  TodoLoaded copyWith({
    TodoEntity? todoEntity,
  }) {
    return TodoLoaded(
      todoEntity ?? this.todoEntity,
    );
  }
}

class TodoError extends TodoDetailState {
  final Exception error;

  const TodoError(this.error);

  @override
  List<Object> get props => [error];

  TodoError copyWith({
    Exception? error,
  }) {
    return TodoError(
      error ?? this.error,
    );
  }
}

class TodoSwicth extends TodoDetailState {
  final bool completed;

  const TodoSwicth({required this.completed});

  @override
  List<Object> get props => [completed];
}
