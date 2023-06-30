// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_demo/config/network/dio_client.dart';
// import 'package:riverpod_demo/data/remote/remote.dart';
// import 'package:riverpod_demo/data/remote/todo_remote_data_source.dart';
// import 'package:riverpod_demo/data/repositories/todo_repositories_impl.dart';
// import 'package:riverpod_demo/domain/domain.dart';

// import '../../presentation/notifiers/todo_notifiers.dart';

// final dioClientProvider = Provider<DioClient>((ref) {
//   return DioClient();
// });

// final todoDataSourceProvider = Provider.family<TodoRemoteDataSource, DioClient>(
//   (_, dioClient) => TodoRemoteDataSourceImpl(dioClient.dio),
// );

// final todoRepositoryProvider = Provider<TodoRepositories>((ref) {
//   final dioClient = ref.read(dioClientProvider);
//   final dataSource = ref.read(todoDataSourceProvider(dioClient));
//   final repository = TodoRepositoriesImpl(todoRemoteDataSource: dataSource);
//   return repository;
// });

// final todoUsecaseProvider = Provider((ref) {
//   final todoRepo = ref.read(todoRepositoryProvider);
//   final usecase = TodoListUsecase(todoRepositories: todoRepo);
//   return usecase;
// });

// final todosProvider =
//     StateNotifierProvider.autoDispose<TodoNotifier, List<TodoEntity>>((ref) {
//   final usecase = ref.read(todoUsecaseProvider);
//   return TodoNotifier(todoListUsecase: usecase);
// });
