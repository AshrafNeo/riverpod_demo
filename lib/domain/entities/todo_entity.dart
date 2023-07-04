import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int userId;
  final int? id;
  final String title;
  final bool completed;

  const TodoEntity({
    required this.userId,
    this.id,
    required this.title,
    required this.completed,
  });

  TodoEntity setCompleted(bool newCompleted) {
    return TodoEntity(
      userId: userId,
      id: id,
      title: title,
      completed: newCompleted,
    );
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}
