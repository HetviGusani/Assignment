class Task {
  final String title;
  final bool isDone;

  Task({required this.title, this.isDone = false});

  Task toggle() {
    return Task(title: title, isDone: !isDone);
  }
}