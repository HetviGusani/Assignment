void main(){

  Set words={"Apple","Orange","Mango","Grapes","Apple","Mango","Banana","Cherry"};

  final sorted=(words.toList()..sort()).toSet();

  print(sorted);

}