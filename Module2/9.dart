import 'dart:io';

void main(){

  print("Enter Number : ");
  var a=int.parse(stdin.readLineSync().toString());
  var fact=1;

  for(int i=1;i<=a;i++){
    fact*=i;
  }

  print("Factorial of $a is : $fact");
}