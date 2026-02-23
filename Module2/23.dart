import 'dart:io';

void main() {
  try {
    print("Enter Number 1 : ");
    int n1 = int.parse(stdin.readLineSync().toString());
    print("Enter Number 2 : ");
    int n2 = int.parse(stdin.readLineSync().toString());
    print("Enter Operator : ");
    String op = stdin.readLineSync().toString();

    int result = 0;

    switch (op) {
      case '+':
        result = n1 + n2;
      case '-':
        result = n1 - n2;
      case '*':
        result = n1 * n2;
      case '/':
        result = n1 ~/ n2;
      default:
        print("Invalid Operator.");
    }
    print(result);
  }on FormatException{
    print("Don't Enter String.");
  }
}