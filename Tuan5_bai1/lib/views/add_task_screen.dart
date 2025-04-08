import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.white, // Nền trắng
  elevation: 0.5,
  centerTitle: true, // Căn giữa title
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue, // Nền xanh cho icon
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
        onPressed: () => Navigator.pop(context),
      ),
    ),
  ),
  title: const Text(
    "Add New",
    style: TextStyle(
      color: Colors.blue, 
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Task',
                hintText: 'Do homework',
              ),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Don\'t give up',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                context.read<TaskViewModel>().addTask(
                      titleController.text,
                      descController.text,
                    );
                Navigator.pop(context);
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
