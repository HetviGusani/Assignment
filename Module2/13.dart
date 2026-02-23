import 'dart:io';

void main(){

  print("Enter length of list : ");
  var l=int.parse(stdin.readLineSync().toString());
  List n=[];

  for(int i=0;i<l;i++){
    stdout.write("Enter n[$i] : ");
    n.add(int.parse(stdin.readLineSync().toString()));
  }

  print("List Elements are : $n");
  print("");

  List temp=n;

  for(int i=0;i<l;i++){

    for (int j = 0; j < l - i - 1; j++) {
      if (temp[j] > temp[j + 1]) {
        int t = temp[j];
        temp[j] = temp[j + 1];
        temp[j + 1] = t;
      }
    }

  }

  print("List in Ascending Order : $temp");
  print("");

  List temp2=n;

  for(int i=0;i<l;i++){

    for (int j = 0; j < l - i - 1; j++) {
      if (temp2[j] < temp2[j + 1]) {
        int t = temp2[j];
        temp2[j] = temp2[j + 1];
        temp2[j + 1] = t;
      }
    }

  }

  print("List in Descending Order : $temp2");

}