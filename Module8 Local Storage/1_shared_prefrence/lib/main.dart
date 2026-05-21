import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDark = prefs.getBool('isDark') ?? false;
    });
  }

  Future<void> _toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
    setState(() {
      _isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme App',
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
          onBackground: Colors.white,
          onSurface: Colors.white,
          onPrimary: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Switcher'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(_isDark ? Icons.dark_mode : Icons.light_mode),
                  SizedBox(width: 8),
                  Switch(
                    value: _isDark,
                    onChanged: _toggleTheme,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            _isDark ? 'Dark Mode' : 'Light Mode',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: _isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}