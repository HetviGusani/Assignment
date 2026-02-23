import 'dart:io';

void main() {
  print("Enter number of terms:");
  int n = int.parse(stdin.readLineSync()!);

  print("Fibonacci Series:");
  for (int i = 0; i < n; i++) {
    stdout.write("${fibonacci(i)} ");
  }
}

fibonacci(int n) {
  if (n == 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

