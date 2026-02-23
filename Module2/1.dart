import 'dart:io';

void main(){
  print ("Enter Your Name");
  var name=stdin.readLineSync().toString();
  print("Enter Your Age");
  int age=int.parse(stdin.readLineSync().toString());

  print("Welcome, $name \nYou have ${100-age} years left to turn 100");


}