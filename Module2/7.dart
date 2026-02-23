import 'dart:io';

void main(){
  int n=int.parse(stdin.readLineSync().toString());

  if(n<1){
    print("Invalid");
  }
  bool isPrime=true;
  for(int i=2;i<n;i++){
    if(n%i==0){
      isPrime=false;
      break;
    }
  }

  if (isPrime) {
    print("$n is a Prime Number");
  } else {
    print("$n is not a Prime Number");
  }
}