// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';

// import 'package:riverpod_demo/data/data.dart';
// import 'package:riverpod_demo/data/datasources/datasources.dart';

// import '../../fixtures/fixture_reader.dart';

// import 'todo_remote_data_source_test.mocks.dart';

// @GenerateMocks([TodoRemoteClient])
// void main() {
//   group("fetch todo", () {
//     late TodoRemoteClient service;
//     const int tTodoId = 1;

//     setUp(() {
//       service = MockTodoRemoteClient();
//     });

//     test("get todo list success 200 OK", () async {
//       //arrange
//       final result = jsonDecode(fixture('todo.json'));
//       final tModel = TodoModel.fromJson(result);
//       final tTodoList = [tModel];

// //act
//       when(service.getTodoList())
//           .thenAnswer((realInvocation) async => tTodoList);

//       final expected = tTodoList;
//       final call = await service.getTodoList();
// //assert
//       expect(call, expected);
//     });

//     test("should throw an Exception when response code is 404 or other",
//         () async {
//       //arrange
//       when(service.getTodoList())
//           .thenThrow(DioException(requestOptions: RequestOptions()));
//       //act
//       final call = service.getTodoList;
//       //assert
//       expect(() => call(), throwsA(const TypeMatcher<DioException>()));
//     });

//     test("get todo details with id $tTodoId", () async {
//       //arrange
//       final result = jsonDecode(fixture('todo.json'));
//       final tModel = TodoModel.fromJson(result);

//       //act
//       when(service.getTodoById(tTodoId))
//           .thenAnswer((realInvocation) async => tModel);

//       final expected = tModel;
//       final call = await service.getTodoById(tTodoId);
//       //assert
//       expect(call, expected);
//     });
//   });
// }
