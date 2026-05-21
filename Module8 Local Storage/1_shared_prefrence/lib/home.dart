import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool isDark;

  final Function(bool) onThemeChanged;

  const HomeScreen({super.key, required this.isDark, required this. onThemeChanged});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Saver")),
      body: Center(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250,),
              Switch(
                value: isDark,
                onChanged: onThemeChanged,
                thumbIcon: WidgetStateProperty.resolveWith<Icon>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Icon(Icons.dark_mode);
                  }
                  return const Icon(Icons.light_mode,color: Colors.orange,);
                }),
              ),
              Text(isDark ? "Dark Theme" : "Light Theme"),
            ],
          ),
        ),
      ),
    );
  }
}
