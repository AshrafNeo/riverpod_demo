import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/presentation/notifiers/providers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_details_state.dart';

class TodoDetails extends ConsumerWidget {
  final int id;

  TodoDetails({
    required this.id,
    super.key,
  });

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todosDetailProvider(id));

    ref.listen(
      todosDetailProvider(id),
      (prev, next) {
        if (next is TodoLoaded) {
          ref
              .read(todosProvider.notifier)
              .toggleTodoComplete(id, next.todoEntity.completed);
        }
      },
    );

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
                  Switch(
                      thumbIcon: thumbIcon,
                      value: state.todoEntity.completed,
                      onChanged: (value) {
                        ref
                            .read(todosDetailProvider(id).notifier)
                            .setCompleted(value, state.todoEntity);
                      }),
                  // Text("${state.todoEntity.completed}"),
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
