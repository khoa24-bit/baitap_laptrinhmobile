import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ThemeApp());
}

class ThemeApp extends StatefulWidget {
  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  late ThemeData _themeData;
  String _selectedTheme = 'light';

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTheme = prefs.getString('theme') ?? 'light';
      _themeData = _getThemeData(_selectedTheme);
    });
  }

  ThemeData _getThemeData(String themeKey) {
    switch (themeKey) {
      case 'dark':
        return ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
          textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
        );
      case 'pink':
        return ThemeData.light().copyWith(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: Colors.pinkAccent,
          textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.white),
        );
      case 'blue':
        return ThemeData.light().copyWith(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.lightBlueAccent,
          textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.white),
        );
      case 'light':
      default:
        return ThemeData.light();
    }
  }

  void _updateTheme(String themeKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeKey);
    setState(() {
      _selectedTheme = themeKey;
      _themeData = _getThemeData(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Setting')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Choosing the right theme sets the tone and personality of your app",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              children: [
                _colorButton('light', Colors.grey[300]!),
                _colorButton('dark', Colors.black),
                _colorButton('pink', Colors.pink),
                _colorButton('blue', Colors.blue),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateTheme(_selectedTheme);
              },
              child: const Text("Apply"),
            )
          ],
        ),
      ),
    );
  }

  Widget _colorButton(String themeKey, Color color) {
    bool isSelected = _selectedTheme == themeKey;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = themeKey;
        });
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey,
            width: isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
