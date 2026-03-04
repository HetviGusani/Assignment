import 'package:flutter/material.dart';

class listTile extends StatefulWidget {
  const listTile({super.key});

  @override
  State<listTile> createState() => _listTileState();
}

class _listTileState extends State<listTile> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Buy Groceries",
      "leadingIcon": Icons.shopping_cart,
      "trailingIcon": Icons.delete,
    },
    {
      "title": "Complete Assignment",
      "leadingIcon": Icons.school,
      "trailingIcon": Icons.delete,
    },
    {
      "title": "Call Mom",
      "leadingIcon": Icons.phone,
      "trailingIcon": Icons.delete,
    },
    {
      "title": "Workout",
      "leadingIcon": Icons.fitness_center,
      "trailingIcon": Icons.delete,
    },
    {
      "title": "Read Book",
      "leadingIcon": Icons.menu_book,
      "trailingIcon": Icons.delete,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom List")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(items[index]["leadingIcon"]),
                      title: Text(items[index]["title"]),
                      trailing: IconButton(
                        icon: Icon(items[index]["trailingIcon"]), onPressed: () { setState(() {
                          items.removeAt(index);
                        }); },
                      ),
                    );
                  },
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
