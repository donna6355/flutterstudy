class Todo {
  final String todo;
  bool isDone;
  bool isDeleted;
  final String id;

  Todo(
      {required this.id,
      required this.todo,
      required this.isDone,
      required this.isDeleted});
}
