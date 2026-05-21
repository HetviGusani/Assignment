import 'package:flutter/material.dart';

import 'Database/MyDB.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyDB db = MyDB.instance;
  List<Map<String, dynamic>> Data = [];
  TextEditingController task = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do")),
      body: RefreshIndicator(
        onRefresh: () {
          return fetch();
        },
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Data.length,
                  itemBuilder: (context, index) {
                    var item = Data[index];
                    return SizedBox(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text(item[MyDB.columnId].toString()),
                              SizedBox(width: 20),
                              Text(item[MyDB.columnTask]),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  showEditDialog(item);
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final confirm = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                          "\u26A0\uFE0F Delete",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        content: const Text(
                                          "Are you sure you want to delete?",
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                            child: const Text("Cancel"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if(confirm==true){
                                    Map<String, dynamic> value = {
                                      MyDB.columnId: item[MyDB.columnId],
                                    };
                                    int result = await db.deleteTask(value);
                                    if (result > 0) {
                                      fetch();
                                  }
                                }  },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),
                content: Form(
                  child: SizedBox(
                    height: 110,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: task,
                          decoration: InputDecoration(
                            hintText: "Enter Task",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await insertTask();
                            Navigator.pop(context);
                          },
                          child: Text("Add"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        label: Text("Add To-Do"),
      ),
    );
  }

  insertTask() async {
    Map<String, dynamic> row = {MyDB.columnTask: task.text.toString()};
    await db.insertTask(row);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Task Inserted")));
    fetch();
  }

  fetch() async {
    final allRows = await db.fetchData();
    Data = allRows;
    setState(() {
      allRows;
    });
  }

  showEditDialog(item) {
    TextEditingController taskC = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Task"),
          content: Form(
            child: SizedBox(
              height: 60,
              child: Column(
                children: [
                  TextFormField(
                    controller: taskC,
                    decoration: InputDecoration(
                      hintText: "Update Here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> value = {
                  MyDB.columnId: item[MyDB.columnId],
                  MyDB.columnTask: taskC.text.toString(),
                };
                int result = await db.editTask(value);
                if (result > 0) {
                  Navigator.pop(context);
                  fetch();
                }
              },
              child: Text("Edit"),
            ),
          ],
        );
      },
    );
  }
}
