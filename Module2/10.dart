import 'dart:io';

void main(){

  print("Enter String : ");
  var a=stdin.readLineSync().toString();

  if(isPalindrome(a)){
    print("$a is Palindrome.");
  }else{
    print("$a is not Palindrome");
  }

}

isPalindrome(String a) {

  var left=0;
  var right=a.length-1;

  while(left<right){

    if(a[left]!=a[right]){
      return false;
    }

    left++;
    right--;

    return true;
  }

}