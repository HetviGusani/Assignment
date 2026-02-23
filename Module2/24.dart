import 'dart:io';

void main() {
  print("Enter the number of elements in the list : ");
  int n = int.parse(stdin.readLineSync().toString());

  List l = [];

  for (int i = 0; i < n; i++) {
    try {
      print("Enter Element l[$i] : ");
      int num = int.parse(stdin.readLineSync().toString());
      l.add(num);
    } on FormatException {
      print("Enter Integers not String.");
      i--;
    }
  }
  print(l);
}
