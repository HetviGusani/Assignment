seprateOP() {
  // Original lists
  List<int> list1 = [5, 2, 8, 1];
  List<int> list2 = [3, 8, 6, 2];
  List<int> list3 = [9, 1, 4, 7];

  List<int> combinedList = [...list1, ...list2, ...list3];

  print("Combined List:");
  print(combinedList);

  List<int> uniqueList = combinedList.toSet().toList();

  uniqueList.sort();

  print("\nFinal List (Unique & Sorted):");
  print(uniqueList);
}