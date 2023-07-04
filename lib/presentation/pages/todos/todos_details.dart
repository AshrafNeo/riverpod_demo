import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/presentation/notifiers/providers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_details_state.dart';

class TodoDetails extends ConsumerWidget {
  final int id;
  const TodoDetails({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todosDetailProvider(id));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state is TodoLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (state is TodoLoaded)
            Center(
              child: Column(
                children: [
                  Text("${state.todoEntity.id}"),
                  Text(state.todoEntity.title),
                  Text("${state.todoEntity.completed}"),
                ],
              ),
            ),
          if (state is TodoError)
            Center(
              child: Text(state.error.toString()),
            )
        ],
      ),
    );
  }
}
