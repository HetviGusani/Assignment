import 'package:flutter/material.dart';

class ListName extends StatefulWidget {
  const ListName({super.key});

  @override
  State<ListName> createState() => _ListNameState();
}

class _ListNameState extends State<ListName> {
  List names = [
    'Aarav',
    'Vivaan',
    'Ishaan',
    'Aditya',
    'Rohan',
    'Anaya',
    'Divya',
    'Kavya',
    'Meera',
    'Priya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview of Names")),
      body: Center(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(names[index]),
                textColor: Colors.red,
                tileColor: Colors.yellow,
                onTap: () {
                  print("${names[index]} tapped");
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
