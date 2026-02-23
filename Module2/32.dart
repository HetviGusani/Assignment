import 'dart:async';

// Function that creates a stream of integers
Stream<int> generateNumbers(int maxCount) async* {
  for (int i = 1; i <= maxCount; i++) {
    await Future.delayed(Duration(seconds: 1)); // simulate delay
    yield i; // emit value to stream
  }
}
