import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';
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
      appBar: AppBar(
        title: Text(
          "LazyColumn",
          style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    "${index + 1} | ${task.title}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("The only way to do great work is to love what you do."),
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TextDetailScreen(task: task),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
