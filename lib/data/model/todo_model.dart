// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_demo/domain/domain.dart';
part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends TodoEntity {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        );

  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, compeleted: $completed)';
  }

  factory TodoModel.fromEntity(TodoEntity entity) => TodoModel(
        userId: entity.userId,
        id: entity.id!,
        title: entity.title,
        completed: entity.completed,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  /// Connect the generated [_$TodoModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
