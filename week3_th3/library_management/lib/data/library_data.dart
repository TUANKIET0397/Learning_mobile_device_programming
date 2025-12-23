import 'package:library_management/models/books.dart';
import 'package:library_management/models/student.dart';

class LibraryData {
  // Dữ liệu sách có sẵn
  static final List<Book> availableBooks = [
    Book(id: '1', title: 'Clean Code', author: 'Robert C. Martin'),
    Book(id: '2', title: 'Design Patterns', author: 'Gang of Four'),
    Book(id: '3', title: 'The Pragmatic Programmer', author: 'Hunt & Thomas'),
    Book(id: '4', title: 'Flutter in Action', author: 'Eric Windmill'),
    Book(id: '5', title: 'Dart Apprentice', author: 'Jonathan Sande'),
    Book(id: '6', title: 'Effective Java', author: 'Joshua Bloch'),
    Book(id: '7', title: 'Head First Java', author: 'Kathy Sierra'),
    Book(id: '8', title: 'Introduction to Algorithms', author: 'CLRS'),
  ];

  final Map<String, Student> students = {};

  // Singleton
  static final LibraryData _instance = LibraryData._internal();
  factory LibraryData() => _instance;
  LibraryData._internal();
}
