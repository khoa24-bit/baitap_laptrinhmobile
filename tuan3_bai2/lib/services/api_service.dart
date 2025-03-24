import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class ApiService {
  static const String apiUrl = "https://amock.io/api/researchUTH/tasks";

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['isSuccess'] == true) {
        return (jsonData['data'] as List)
            .map((task) => Task.fromJson(task))
            .toList();
      } else {
        throw Exception("API error: ${jsonData['message']}");
      }
    } else {
      throw Exception("Failed to load tasks");
    }
  }
}
