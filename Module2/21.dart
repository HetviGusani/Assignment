import 'dart:io';

void main() {
  print("Enter Number : ");
  int n = int.parse(stdin.readLineSync().toString());
  print("Enter Another Number :");
  int n2=int.parse(stdin.readLineSync().toString());

  int result;
  try{

    result=n~/n2;
    print(result);
  }catch(e){

    print(e);
  }finally{

    //print(result);
  }
}
