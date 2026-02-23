import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchData() async {

  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  try {
    print("Loading data...");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode JSON data
      final data = jsonDecode(response.body);

      print("Data loaded successfully!\n");
      print("User ID : ${data['userId']}");
      print("ID      : ${data['id']}");
      print("Title   : ${data['title']}");
      print("Body    : ${data['body']}");
    } else {
      // Server returned an error
      print("Failed to load data. Status code: ${response.statusCode}");
    }
  } catch (e) {
    // Network error / parsing error
    print("Error occurred while fetching data:");
    print(e);
  }

}