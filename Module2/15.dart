import 'dart:io';

void main() {
  print("Enter a string:");
  String str = stdin.readLineSync()!;

  Map<String, int> freq = {};

  for (int i = 0; i < str.length; i++) {
    String ch = str[i];

    if (freq.containsKey(ch)) {
      freq[ch] = freq[ch]! + 1;
    } else {
      freq[ch] = 1;
    }
  }

  print("Character Frequency:");
  freq.forEach((key, value) {
    print("$key : $value");
  });
}
