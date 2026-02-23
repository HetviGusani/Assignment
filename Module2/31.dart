highOrdered(){
  List<int> numbers = [2, 4, 6, 8];

  // Higher-order function calls
  var squares = transformList(numbers, (n) => n * n);
  var cubes = transformList(numbers, (n) => n * n * n);
  var halves = transformList(numbers, (n) => n / 2);

  print("Original List: $numbers");
  print("Squares      : $squares");
  print("Cubes        : $cubes");
  print("Halves       : $halves");
}

transformList(List<int> list, Function operation) {
  return list.map((item)=>operation(item)).toList();

}