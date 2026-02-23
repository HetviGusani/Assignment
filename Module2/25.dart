Future<void> main() async {

  print("Loading......");

  String data=await method();
  print(data);
}

Future<String> method() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Completed';
}