import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row Widget"),),
      body: Center(
        child: Container(
          height: 200,
          width: 120,
          child: Row(
            children: [
              Container(width: 50,color: Colors.blue,),
              SizedBox(width: 10,),
              Container(width: 20,color: Colors.red,),
              SizedBox(width: 10,),
              Container(width: 30,color: Colors.yellow,),
            ],
          ),
        ),
      ),
    );
  }
}
