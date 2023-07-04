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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todosProvider);
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
                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TodoDetails(
                                          id: todo.id!,
                                        )));
                              },
                              leading: const CircleAvatar(),
                              title: Text(
                                todo.title,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              trailing: Text(
                                '${todo.completed}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              subtitle: Text(
                                todo.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
    );
  }
}
