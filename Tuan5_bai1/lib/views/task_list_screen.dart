import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const TaskListContent(),
    const Center(child: Text("Tasks Page")),
    const Center(child: Text("Settings Page")),
    const Center(child: Text("Proflie Page")),
  ];

  void _navigateToAddTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTaskScreen()),
    );
  }

  void _onItemTapped(int index) {
  setState(() => _selectedIndex = index);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0.5,
  centerTitle: true, // căn giữa title
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  ),
  title: const Text(
    'List',
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
),

      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _navigateToAddTask,
        child: const Icon(Icons.add, color: Colors.white, size: 24),
        shape: const CircleBorder(),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }
}

class TaskListContent extends StatelessWidget {
  const TaskListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskViewModel>().tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (_, index) {
        final task = tasks[index];
        return Card(
          color: Colors.primaries[index % Colors.primaries.length].shade100,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  task.description,
                  style: const TextStyle(
                    fontSize: 14, 
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
