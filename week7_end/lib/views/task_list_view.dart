import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/task_view_model.dart';
import '../widgets/task_card.dart';
import 'add_task_view.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  static const _cardColors = [
    Color(0xFFCFE8FF),
    Color(0xFFE6C7D1),
    Color(0xFFDDE6B5),
    Color(0xFFE8C6C6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const AddTaskView()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.tasks.isEmpty) {
              return const Center(child: Text('No tasks yet'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 100,
                top: 16,
                left: 16,
                right: 16,
              ),
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                final color = _cardColors[index % _cardColors.length];
                return Dismissible(
                  key: ValueKey(task.id ?? '${task.title}-$index'),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => viewModel.deleteTask(task),
                  background: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: TaskCard(task: task, backgroundColor: color),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AddTaskView()));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
