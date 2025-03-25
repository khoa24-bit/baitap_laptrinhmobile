import 'package:flutter/material.dart';
import 'component_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hình ảnh logo
            Image.asset(
              '../../assets/images/logo.png', // Thay bằng đường dẫn hình ảnh của bạn
              height: 150,
            ),
            SizedBox(height: 20),

            // Tiêu đề
            Text(
              "Navigation",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Mô tả
            Text(
              "is a framework that simplifies the implementation of navigation between different UI components (activities, fragments, or composables) in an app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 40),

            // Nút "PUSH"
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComponentListScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  backgroundColor: Colors.blue[500],
                  foregroundColor: Colors.white,
                ),
                child: Text("PUSH", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
