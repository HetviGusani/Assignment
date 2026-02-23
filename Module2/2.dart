import 'dart:io';

void main(){
  print("Enter Number :");
  int n=int.parse(stdin.readLineSync().toString());

  if(n%2==0){
    print("You Have Entered Even Number");
  }else{
    print("You Have Entered Odd Number");
  }


}