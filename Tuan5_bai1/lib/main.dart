import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/task_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'UTH SmartTasks',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskListScreen(),
    );
  }
}
