import 'package:flutter/material.dart';

class SerchBar extends StatefulWidget {
  const SerchBar({super.key});

  @override
  State<SerchBar> createState() => _SerchBarState();
}

class _SerchBarState extends State<SerchBar> {
  List<String> commonWords = [
    "Apple",
    "Ant",
    "Air",

    "Ball",
    "Book",
    "Bird",

    "Cat",
    "Car",
    "Cake",

    "Dog",
    "Door",
    "Duck",

    "Elephant",
    "Egg",
    "Earth",

    "Fish",
    "Flower",
    "Fire",

    "Goat",
    "Girl",
    "Game",

    "House",
    "Hat",
    "Horse",

    "Ice",
    "Ink",
    "Island",

    "Juice",
    "Jar",
    "Jungle",

    "Kite",
    "King",
    "Key",

    "Lion",
    "Lamp",
    "Leaf",

    "Monkey",
    "Moon",
    "Milk",

    "Nest",
    "Nose",
    "Notebook",

    "Orange",
    "Owl",
    "Ocean",

    "Pen",
    "Paper",
    "Pencil",

    "Queen",
    "Quick",
    "Quiet",

    "Rabbit",
    "Rain",
    "River",

    "Sun",
    "Star",
    "School",

    "Tiger",
    "Tree",
    "Table",

    "Umbrella",
    "Uncle",
    "Uniform",

    "Van",
    "Village",
    "Vase",

    "Water",
    "Window",
    "Wolf",

    "Xylophone",
    "X-ray",

    "Yacht",
    "Yellow",
    "Yak",

    "Zebra",
    "Zoo",
    "Zero",
  ];

  List filterWords = [];

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterWords = commonWords;
  }

  filterSearch(String query) {
    List result;

    if (query.isEmpty) {
      result = commonWords;
    } else {
      result = commonWords
          .where((word) => word.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filterWords = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Bar")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              SizedBox(width: 50),
              TextField(
                onChanged: filterSearch,
                decoration: InputDecoration(
                  hintText: "Search Here",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              Expanded(
                child: filterWords.isEmpty
                    ? Center(child: Text("No Suggestion Found"))
                    : ListView.builder(
                  itemCount: filterWords.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(filterWords[index]), onTap: () {
                      search.text = filterWords[index];
                    },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
