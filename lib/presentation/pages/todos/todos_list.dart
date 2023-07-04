import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/presentation/notifiers/providers.dart';
import 'package:riverpod_demo/presentation/notifiers/state/todo_state.dart';
import 'package:riverpod_demo/presentation/pages/todos/todos_details.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(todosProvider.notifier);
      notifier.getTodoList();
    }
  }

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
  Widget build(BuildContext context) {
    final state = ref.watch(todosProvider);

    ref.listen(todosProvider.select((value) => value.message), (prev, next) {
      if (next == 'Deleted Successfully') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.green, content: Text(next)));
      }
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo"),
      ),
      body: state.state == TodoConcreteState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => const Divider(),
                          controller: scrollController,
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) {
                            final todo = state.todoList[index];
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(color: Colors.red),
                              key: Key("${todo.id}"),
                              onDismissed: (direction) {
                                ref
                                    .read(todosProvider.notifier)
                                    .deleteTodo(todo.id!);
                              },
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TodoDetails(
                                        id: todo.id!,
                                      ),
                                    ),
                                  );
                                },
                                leading: const CircleAvatar(),
                                title: Text(
                                  todo.title,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                trailing: Switch(
                                    thumbIcon: thumbIcon,
                                    value: todo.completed,
                                    onChanged: (value) {
                                      ref
                                          .read(todosProvider.notifier)
                                          .toggleTodoComplete(todo.id!, value);
                                    }),
                                subtitle: Text(
                                  todo.title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (state.state == TodoConcreteState.fetchingMore)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
