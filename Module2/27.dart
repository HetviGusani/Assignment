import 'dart:async';

Future<String> fetchUser(int id) async {
  await Future.delayed(Duration(seconds: 2)); // simulate network delay
  return "User $id loaded";
}

Future<void> fetchAllUsers() async {
  print("Loading users...\n");

  List<String> users = [];

  for (int i = 1; i <= 3; i++) {
    try {
      String user = await fetchUser(i); // wait for each user
      users.add(user);
      print("$user");
    } catch (e) {
      print("Error loading user $i: $e");
    }
  }

  print("\nAll users loaded!\n");

  // Display all users
  for (var user in users) {
    print(user);
  }
}
