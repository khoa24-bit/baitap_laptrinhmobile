import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TextDetailScreen extends StatelessWidget {
  final Task task;

  TextDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description: ${task.description}"),
              SizedBox(height: 10),
              Text("Status: ${task.status}"),
              SizedBox(height: 10),
              Text("Priority: ${task.priority}"),
              SizedBox(height: 10),
              Text("Category: ${task.category}"),
              SizedBox(height: 10),
              Text("Created At: ${task.createdAt.toLocal()}"),
              SizedBox(height: 10),
              Text("Updated At: ${task.updatedAt.toLocal()}"),
              SizedBox(height: 20),
              Text("Due Date: ${task.dueDate.toLocal()}"),
              SizedBox(height: 20),

              // Subtasks
              Text("Subtasks:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...task.subtasks.map((subtask) => ListTile(
                    leading: Icon(subtask.isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked),
                    title: Text(subtask.title),
                  )),

              // Attachments
              SizedBox(height: 20),
              Text("Attachments:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...task.attachments.map((attachment) => ListTile(
                    leading: Icon(Icons.attach_file),
                    title: Text(attachment.fileName),
                    subtitle: Text(attachment.fileUrl),
                  )),

              // Reminders
              SizedBox(height: 20),
              Text("Reminders:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...task.reminders.map((reminder) => ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text("Time: ${reminder.time}"),
                    subtitle: Text("Type: ${reminder.type}"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
