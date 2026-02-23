import "dart:io";
void main() {
  print("Enter Marks for english:");
  int eng = int.parse(stdin.readLineSync().toString());
  print("Enter Marks for Maths:");
  int mat = int.parse(stdin.readLineSync().toString());
  print("Enter Marks for Gujrati:");
  int guj = int.parse(stdin.readLineSync().toString());
  print("Enter Marks for Hindi:");
  int hin = int.parse(stdin.readLineSync().toString());
  print("Enter Marks for Science:");
  int sci = int.parse(stdin.readLineSync().toString());

  int total = eng + mat + guj + hin + sci;
  var percent = total / 5;
  print(percent);

  if (percent >= 90 && percent<=100) {
    print("A Grade");
  }
  else if (percent >= 80 && percent<=89) {
    print("B Grade");
  }
  else if (percent >= 70&& percent<=79){
    print("C Grade");
  }
  else if(percent >= 60&& percent<=69) {
    print("D Grade");
  }
  else {
    print("F Grade");
  }

}