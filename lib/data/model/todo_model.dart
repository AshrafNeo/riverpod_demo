// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_demo/domain/entities/todo_entity.dart';
part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends TodoEntity {
  final String userId;
  final String id;
  final String title;
  final bool compeleted;
  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.compeleted,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          completed: compeleted,
        );

  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, compeleted: $compeleted)';
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  /// Connect the generated [_$TodoModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
