import 'package:flutter/material.dart';

class increDecre extends StatefulWidget {
  const increDecre({super.key});

  @override
  State<increDecre> createState() => _increDecreState();
}

class _increDecreState extends State<increDecre> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Button")),
      body: Center(child: Text("Counter : $count")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },child: Icon(Icons.remove),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
