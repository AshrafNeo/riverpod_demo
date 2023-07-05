// Mocks generated by Mockito 5.4.2 from annotations
// in riverpod_demo/test/data/remote/todo_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:riverpod_demo/data/data.dart' as _i2;
import 'package:riverpod_demo/data/datasources/remote/todo_remote_client.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTodoModel_0 extends _i1.SmartFake implements _i2.TodoModel {
  _FakeTodoModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoRemoteClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRemoteClient extends _i1.Mock implements _i3.TodoRemoteClient {
  MockTodoRemoteClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.TodoModel>> getTodoList(
    int? id,
    int? limit,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTodoList,
          [
            id,
            limit,
          ],
        ),
        returnValue: _i4.Future<List<_i2.TodoModel>>.value(<_i2.TodoModel>[]),
      ) as _i4.Future<List<_i2.TodoModel>>);
  @override
  _i4.Future<_i2.TodoModel> getTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i4.Future<_i2.TodoModel>.value(_FakeTodoModel_0(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.TodoModel>);
  @override
  _i4.Future<_i2.TodoModel> createTodo(_i2.TodoModel? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTodo,
          [todo],
        ),
        returnValue: _i4.Future<_i2.TodoModel>.value(_FakeTodoModel_0(
          this,
          Invocation.method(
            #createTodo,
            [todo],
          ),
        )),
      ) as _i4.Future<_i2.TodoModel>);
  @override
  _i4.Future<_i2.TodoModel> updateTodo(
    int? id,
    _i2.TodoModel? todo,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [
            id,
            todo,
          ],
        ),
        returnValue: _i4.Future<_i2.TodoModel>.value(_FakeTodoModel_0(
          this,
          Invocation.method(
            #updateTodo,
            [
              id,
              todo,
            ],
          ),
        )),
      ) as _i4.Future<_i2.TodoModel>);
  @override
  _i4.Future<void> deleteTodo(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
