import 'dart:io';

Future<void> main() async {
  try {
    // File path
    File file = File('example.txt');

    // 🔹 Data to write
    String data = "Hello! This is a Dart file handling example.";

    // 🔹 Write data to file
    await file.writeAsString(data);
    print("Data written to file successfully.");

    // 🔹 Read data from file
    String content = await file.readAsString();
    print("\nData read from file:");
    print(content);
  }

  // 🔴 Handle file not found error
  on FileSystemException catch (e) {
    print("File system error: ${e.message}");
  }

  // 🔴 Handle any other error
  catch (e) {
    print("An unexpected error occurred: $e");
  }

  finally {
    print("\nFile operation completed.");
  }
}