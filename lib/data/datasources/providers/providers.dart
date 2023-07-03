import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/config/network/dio_client.dart';
import 'package:riverpod_demo/config/network/provider/dio_provider.dart';

import '../datasources.dart';

final todoRemoteClientProvider = Provider.family<TodoRemoteClient, DioClient>(
  (_, dioClient) => TodoRemoteClient(dioClient.dio),
);

final todoDataSourceProvider = Provider<TodoRemoteDataSource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  final remoteClient = ref.read(todoRemoteClientProvider(dioClient));
  final dataSourceImpl =
      TodoRemoteDataSourceImpl(todoRemoteClient: remoteClient);
  return dataSourceImpl;
});
