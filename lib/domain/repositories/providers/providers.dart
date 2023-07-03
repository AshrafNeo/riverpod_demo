import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/data/data.dart';
import 'package:riverpod_demo/data/datasources/providers/providers.dart';
import '../../domain.dart';

final todoRepositoryProvider = Provider<TodoRepositories>((ref) {
  final dataSourceImpl = ref.read(todoDataSourceProvider);
  final repository = TodoRepositoriesImpl(todoRemoteDataSource: dataSourceImpl);
  return repository;
});
