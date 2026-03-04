import 'package:flutter/material.dart';

class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  TextEditingController task = TextEditingController();

  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: task,
                  decoration: InputDecoration(
                    hintText: "Add Task",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(task.text);
                    });
                    task.clear();
                  },
                  child: Text("Add"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(tasks[index]+index.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction){
                          setState(() {
                            tasks.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Deleted")));
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(tasks[index]),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
