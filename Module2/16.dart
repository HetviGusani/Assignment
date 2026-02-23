import 'dart:io';

Map addBook = <String, int>{};

void main() {
  int n;

  do {
    print(
        "\nEnter Your Choice :"
            "\n1 for Add Data"
            "\n2 for Update Data"
            "\n3 for Remove Data"
            "\n4 for Display Data"
            "\n5 for Exit"
    );

    n = int.parse(stdin.readLineSync()!);

    switch (n) {
      case 1:
        add();

      case 2:
        update();

      case 3:
        remove();

      case 4:
        print("Phone Book: $addBook");

      case 5:
        print("Exiting program...");
        break;

      default:
        print("Invalid Choice");
    }
  } while (n != 5);
}
remove() {
  print("Enter Name whose number you want to Delete: ");
  var name = stdin.readLineSync().toString();

  addBook.remove(name);
}

update() {
  print("Enter Name whose number you want to Update: ");
  var name = stdin.readLineSync().toString();
  print("Enter Number : ");
  int number = int.parse(stdin.readLineSync().toString());

  addBook[name] = number;
}

add() {
  print("Enter Name : ");
  var name = stdin.readLineSync().toString();
  print("Enter Number : ");
  int number = int.parse(stdin.readLineSync().toString());

  addBook[name] = number;
}
