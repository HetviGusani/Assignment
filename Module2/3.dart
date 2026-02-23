import 'dart:io';

void main(){

  print("Enter Number : ");
  var a=int.parse(stdin.readLineSync().toString());

  if(a%2==0){
    print("$a is Even Number.");
  }else{
    print("$a is Odd Number");
  }

}

