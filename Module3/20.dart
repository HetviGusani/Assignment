import 'package:flutter/material.dart';

class taskManager extends StatefulWidget {
  const taskManager({super.key});

  @override
  State<taskManager> createState() => _taskManagerState();
}

class _taskManagerState extends State<taskManager> {
  TextEditingController task = TextEditingController();

  List<Map<String, dynamic>> tasks = [];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
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
                      tasks.add({"title": task.text, "isDone": false});
                    });
                    task.clear();
                  },
                  child: Text("Add"),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        value: tasks[index]["isDone"],
                        title: Text(
                          tasks[index]["title"],
                          style: TextStyle(
                            decoration: tasks[index]["isDone"]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            tasks[index]["isDone"] = value!;
                          });
                        },
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
