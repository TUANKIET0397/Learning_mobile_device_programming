class Student {
  final String name;
  final List<String> borrowedBookIds;

  Student({required this.name, List<String>? borrowedBookIds})
    : borrowedBookIds = borrowedBookIds ?? [];
}
