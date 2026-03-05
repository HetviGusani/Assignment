import 'package:flutter/material.dart';

class BottomNAvigation extends StatefulWidget {
  const BottomNAvigation({super.key});

  @override
  State<BottomNAvigation> createState() => _BottomNAvigationState();
}

class _BottomNAvigationState extends State<BottomNAvigation> {
  List pages = ["News Screen", "Message Screen", "Profile Screen"];

  int selectedIndex = 0;

  itemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation")),
      body: Center(child: Text(pages[selectedIndex])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: itemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
