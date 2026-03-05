import 'package:flutter_riverpod/legacy.dart';
import 'model.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }

  void toggleTask(int index) {
    state[index] = state[index].toggle();
    state = [...state];
  }

  void removeTask(int index) {
    final newList = [...state];
    newList.removeAt(index);
    state = newList;
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});
