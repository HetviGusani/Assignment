import 'dart:io';

class BankAccount {
  int accNumber;
  String accHolder;
  int balance;

  BankAccount(this.accNumber, this.accHolder, this.balance);

  void choice() {
    int n;

    do {
      print(
          "\nEnter Your Choice :"
              "\n1 for Deposit Amount"
              "\n2 for Withdrawal"
              "\n3 for Check Balance"
              "\n4 for Exit");

      n = int.parse(stdin.readLineSync()!);

      switch (n) {
        case 1:
          print("Enter Amount to Deposit : ");
          int amount = int.parse(stdin.readLineSync()!);
          deposit(amount);
          break;

        case 2:
          print("Enter Amount to Withdraw : ");
          int amount = int.parse(stdin.readLineSync()!);
          withdraw(amount);
          break;

        case 3:
          checkBalance();
          break;

        case 4:
          print("Exiting program");
          break;

        default:
          print("Invalid Choice");
      }
    } while (n != 4);
  }

  void deposit(int amount) {
    balance += amount;
    print("Amount Deposited Successfully");
  }

  void withdraw(int amount) {
    if (amount <= balance) {
      balance -= amount;
      print("Amount Withdrawn Successfully");
    } else {
      print("Insufficient Balance!");
    }
  }

  void checkBalance() {
    print("Your Balance is $balance");
  }
}

void main() {
  var acc1 = BankAccount(123456789, 'Hetvi Gusani', 50000);
  acc1.choice();
}
