import 'dart:io';

void main(){
  print("Enter Number 1 : ");
  int n1=int.parse(stdin.readLineSync().toString());
  print("Enter Number 2 : ");
  int n2=int.parse(stdin.readLineSync().toString());
  print("Enter Your Choice(+,-,*,/) : ");
  String ch=stdin.readLineSync().toString();

  switch(ch){
    case '+':print("$n1 + $n2 = ${n1+n2}");
    case '-':print("$n1 - $n2 = ${n1-n2}");
    case '*':print("$n1 * $n2 = ${n1*n2}");
    case '/':print("$n1 / $n2 = ${n1/n2}");
  }
}