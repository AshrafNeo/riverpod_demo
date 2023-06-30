import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/todo_model.dart';
import 'package:riverpod_demo/domain/domain.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tTodoModel = TodoModel(
      userId: 1, id: 1, title: "delectus aut autem", completed: false);
  test(
    "check if subclass is same or not",
    () => {
      expect(
        tTodoModel,
        isA<TodoEntity>(),
      ),
    },
  );

  group("Check fromJson and toJson of TODO MODEL", () {
    test("return todo object from json", () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('todo.json'));
      // act
      final result = TodoModel.fromJson(jsonMap);
      // assert
      expect(result, tTodoModel);
    });
  });
}
