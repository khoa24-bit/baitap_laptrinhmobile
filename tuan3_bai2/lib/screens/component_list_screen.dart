import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/task_model.dart';
import 'text_detail_screen.dart';

class ComponentListScreen extends StatefulWidget {
  @override
  _ComponentListScreenState createState() => _ComponentListScreenState();
}

class _ComponentListScreenState extends State<ComponentListScreen> {
  late Future<List<Task>> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = ApiService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: FutureBuilder<List<Task>>(
        future: _tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed to load tasks"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No tasks available"));
          }

          final tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text("Due: ${task.dueDate.toLocal()}"),
                trailing: Text(task.status),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextDetailScreen(task: task),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
