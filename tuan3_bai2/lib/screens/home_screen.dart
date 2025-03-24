import 'package:flutter/material.dart';
import 'component_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComponentListScreen(),
              ),
            );
          },
          child: Text("View Tasks"),
        ),
      ),
    );
  }
}
