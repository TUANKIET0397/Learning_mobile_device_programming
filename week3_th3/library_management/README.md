# 📚 Hệ thống Quản lý Thư viện - Library Management System

## 🎯 Tổng quan dự án

Ứng dụng Flutter quản lý mượn/trả sách của sinh viên với 3 tab chính:

-   **Quản lý**: Thêm sách cho sinh viên
-   **DS Sách**: Danh sách tất cả sách trong thư viện
-   **Sinh viên**: Danh sách sinh viên

---

## 🏗️ Kiến trúc & OOP

### 📁 Cấu trúc thư mục

```
lib/
├── models/              # Các class đối tượng (OOP)
│   ├── books.dart       # Class Book
│   └── student.dart     # Class Student
├── data/                # Quản lý dữ liệu toàn cục
│   └── library_data.dart # Singleton pattern
└── pages/               # Các màn hình
    ├── lib_manage_page.dart  # Main container với BottomNav
    ├── home_page.dart        # Tab Quản lý
    ├── books_manage_page.dart # Tab DS Sách
    └── users_page.dart       # Tab Sinh viên
```

---

## 🎓 OOP được áp dụng ở đâu?

### 1️⃣ **Class Models** (Encapsulation - Đóng gói)

#### `Book` class (`lib/models/books.dart`)

```dart
class Book {
  final String id;        // ID duy nhất
  final String title;     // Tên sách
  final String author;    // Tác giả

  Book({
    required this.id,
    required this.title,
    required this.author
  });
}
```

**Mục đích OOP:**

-   Đóng gói thông tin sách thành 1 đối tượng
-   Dễ quản lý, truyền dữ liệu giữa các màn hình
-   Có thể mở rộng (thêm ISBN, năm xuất bản, v.v.)

#### `Student` class (`lib/models/student.dart`)

```dart
class Student {
  final String name;                    // Tên sinh viên
  final List<String> borrowedBookIds;   // Danh sách ID sách đã mượn

  Student({
    required this.name,
    List<String>? borrowedBookIds
  }) : borrowedBookIds = borrowedBookIds ?? [];
}
```

**Mục đích OOP:**

-   Mô hình hóa sinh viên với dữ liệu liên quan
-   Sử dụng Initializer List để khởi tạo giá trị mặc định
-   Liên kết sinh viên với sách thông qua `borrowedBookIds`

---

### 2️⃣ **Singleton Pattern** (Design Pattern)

#### `LibraryData` class (`lib/data/library_data.dart`)

```dart
class LibraryData {
  // Dữ liệu tĩnh - sách có sẵn trong thư viện
  static final List<Book> availableBooks = [
    Book(id: '1', title: 'Clean Code', author: 'Robert C. Martin'),
    // ... 8 quyển sách
  ];

  // Dữ liệu động - Map lưu sinh viên và sách của họ
  final Map<String, Student> students = {};

  // SINGLETON PATTERN
  static final LibraryData _instance = LibraryData._internal();
  factory LibraryData() => _instance;
  LibraryData._internal();
}
```

**Giải thích Singleton:**

-   `_instance`: Biến static lưu instance duy nhất
-   `factory LibraryData()`: Constructor factory trả về cùng 1 instance
-   `LibraryData._internal()`: Private constructor, không thể tạo từ bên ngoài

**Tại sao dùng Singleton?**

-   ✅ **Dữ liệu toàn cục**: Chia sẻ giữa các tab
-   ✅ **Tránh duplicate**: Chỉ có 1 nguồn dữ liệu duy nhất
-   ✅ **Tiết kiệm bộ nhớ**: Không tạo nhiều instance

**So sánh:**

```dart
// ❌ KHÔNG dùng Singleton
var data1 = LibraryData();  // Instance mới
var data2 = LibraryData();  // Instance khác → mất dữ liệu

// ✅ Dùng Singleton
var data1 = LibraryData();  // Instance A
var data2 = LibraryData();  // Cũng là Instance A → giữ dữ liệu
```

---

## 🔄 Cách lưu dữ liệu khi chuyển tab

### 🧠 Tư duy thiết kế

#### ❌ Cách SAI (Dữ liệu bị mất)

```dart
class _HomePageState extends State<HomePage> {
  final List<Book> books = [];  // Lưu trong State
  // → Khi chuyển tab, HomePage rebuild → books bị reset
}
```

#### ✅ Cách ĐÚNG (Dữ liệu được giữ)

```dart
class _LibManagePageState extends State<LibManagePage> {
  final LibraryData _libraryData = LibraryData(); // Singleton

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(libraryData: _libraryData), // Truyền vào
      BookManagePage(),
      UsersPage(),
    ];
  }
}
```

### 📊 Flow lưu dữ liệu

```
┌─────────────────────────────────────┐
│   LibManagePage (Parent)            │
│   - Tạo LibraryData (Singleton)     │
│   - Tạo _pages[] trong initState    │
└────────┬────────────────────────────┘
         │
         ├─► HomePage(libraryData) ──► Nhận reference
         ├─► BookManagePage()
         └─► UsersPage()

Khi chuyển tab:
- LibManagePage KHÔNG rebuild
- _libraryData KHÔNG bị hủy
- Dữ liệu vẫn còn trong memory
```

### 🔑 Các điểm quan trọng

1. **Tạo Singleton ở Parent** (`LibManagePage`)

    ```dart
    final LibraryData _libraryData = LibraryData();
    ```

2. **Tạo pages trong `initState`** (chỉ chạy 1 lần)

    ```dart
    @override
    void initState() {
      super.initState();
      _pages = [
        HomePage(libraryData: _libraryData), // ← Truyền reference
        // ...
      ];
    }
    ```

3. **Child page nhận reference**

    ```dart
    class HomePage extends StatefulWidget {
      final LibraryData libraryData; // ← Nhận từ parent

      const HomePage({required this.libraryData});
    }
    ```

4. **Sử dụng trong State**
    ```dart
    class _HomePageState extends State<HomePage> {
      void _saveData() {
        widget.libraryData.students[name] = Student(...); // Lưu vào Singleton
      }
    }
    ```

---

## 💡 Logic nghiệp vụ (Business Logic)

### 🎯 Use Case: Thêm sách cho sinh viên

#### **Flow hoàn chỉnh:**

```
1. User nhập tên "Nguyen Van A"
   ↓
2. onChanged() tự động trigger
   ↓
3. Kiểm tra: Sinh viên đã tồn tại?
   ├─ YES → Load sách từ LibraryData.students["Nguyen Van A"]
   └─ NO  → Hiện danh sách trống
   ↓
4. User nhấn "Thêm"
   ↓
5. Mở Dialog với sách chưa chọn
   ↓
6. User chọn "Clean Code"
   ↓
7. Thêm vào _selectedBooks (List tạm thời)
   ↓
8. User nhấn "Thay đổi"
   ↓
9. Lưu vào LibraryData.students["Nguyen Van A"]
   ↓
10. Dữ liệu được giữ khi chuyển tab
```

#### **Code implementation:**

```dart
// BƯỚC 1-3: Tự động load khi nhập tên
void _onNameChanged(String name) {
  if (name.trim().isEmpty) {
    setState(() {
      _currentStudentName = null;
      _selectedBooks = [];
    });
    return;
  }

  setState(() {
    _currentStudentName = name.trim();

    // Kiểm tra sinh viên đã tồn tại
    if (widget.libraryData.students.containsKey(name.trim())) {
      final student = widget.libraryData.students[name.trim()]!;
      // Load sách đã lưu
      _selectedBooks = LibraryData.availableBooks
          .where((book) => student.borrowedBookIds.contains(book.id))
          .toList();
    } else {
      _selectedBooks = []; // Sinh viên mới
    }
  });
}

// BƯỚC 4-7: Thêm sách vào list tạm
void _showAddBookDialog() {
  // Lọc sách chưa chọn
  final selectedIds = _selectedBooks.map((b) => b.id).toSet();
  final availableToAdd = LibraryData.availableBooks
      .where((book) => !selectedIds.contains(book.id))
      .toList();

  // Hiện dialog
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Chọn sách để mượn'),
      content: ListView.builder(
        itemCount: availableToAdd.length,
        itemBuilder: (context, index) {
          final book = availableToAdd[index];
          return ListTile(
            title: Text(book.title),
            onTap: () {
              setState(() {
                _selectedBooks.add(book); // Thêm vào list tạm
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    ),
  );
}

// BƯỚC 8-9: Lưu vào Singleton
void _saveChanges() {
  final bookIds = _selectedBooks.map((b) => b.id).toList();

  // Lưu vào Map toàn cục
  widget.libraryData.students[_currentStudentName!] = Student(
    name: _currentStudentName!,
    borrowedBookIds: bookIds,
  );

  // Hiện thông báo
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Đã lưu thay đổi cho $_currentStudentName')),
  );
}
```

---

## 🎨 State Management

### Local State (trong `_HomePageState`)

```dart
String? _currentStudentName;      // Tên sinh viên đang chỉnh sửa
List<Book> _selectedBooks = [];   // Sách tạm thời (chưa lưu)
```

**Tại sao dùng local state?**

-   ✅ UI tạm thời (chưa commit)
-   ✅ Có thể hủy/reset dễ dàng
-   ✅ Không ảnh hưởng dữ liệu toàn cục

### Global State (trong `LibraryData`)

```dart
final Map<String, Student> students = {}; // Dữ liệu đã lưu
```

**Tại sao dùng global state?**

-   ✅ Chia sẻ giữa các tab
-   ✅ Persistent khi chuyển tab
-   ✅ Single source of truth

---

## 📝 Design Patterns được sử dụng

### 1. **Singleton Pattern**

-   **Vị trí**: `LibraryData`
-   **Mục đích**: Đảm bảo chỉ có 1 instance quản lý dữ liệu

### 2. **Factory Pattern**

-   **Vị trí**: Constructor của `LibraryData`
-   **Mục đích**: Kiểm soát việc tạo object

### 3. **Observer Pattern** (Flutter built-in)

-   **Vị trí**: `StatefulWidget` + `setState()`
-   **Mục đích**: UI tự động cập nhật khi state thay đổi

---

## 🚀 Cách mở rộng

### Thêm tính năng mới

#### 1. Thêm thuộc tính cho Book

```dart
class Book {
  final String id;
  final String title;
  final String author;
  final String isbn;        // ← MỚI
  final int publishYear;    // ← MỚI

  Book({...});
}
```

#### 2. Lưu database (SQLite/Hive)

```dart
class LibraryData {
  Future<void> saveToDatabase() async {
    final db = await getDatabase();
    for (var entry in students.entries) {
      await db.insert('students', entry.value.toMap());
    }
  }

  Future<void> loadFromDatabase() async {
    final db = await getDatabase();
    final maps = await db.query('students');
    students = Map.fromEntries(
      maps.map((m) => MapEntry(m['name'], Student.fromMap(m)))
    );
  }
}
```

#### 3. Search/Filter

```dart
List<Book> searchBooks(String query) {
  return LibraryData.availableBooks
      .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
```

---

## 🎯 Tóm tắt các khái niệm quan trọng

| Khái niệm                  | Giải thích                          | Ví dụ trong code                              |
| -------------------------- | ----------------------------------- | --------------------------------------------- |
| **Encapsulation**          | Đóng gói dữ liệu trong class        | `Book`, `Student`                             |
| **Singleton**              | Chỉ có 1 instance duy nhất          | `LibraryData`                                 |
| **State Management**       | Quản lý trạng thái UI               | `_selectedBooks` (local), `students` (global) |
| **Dependency Injection**   | Truyền dependencies qua constructor | `HomePage(libraryData: _libraryData)`         |
| **Separation of Concerns** | Tách model, data, UI                | Thư mục `models/`, `data/`, `pages/`          |

---

## 📚 Học thêm

-   **OOP trong Dart**: https://dart.dev/guides/language/language-tour#classes
-   **Design Patterns**: https://refactoring.guru/design-patterns
-   **Flutter State Management**: https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro

---

## ✅ Checklist kiểm tra hiểu bài

-   [ ] Hiểu cách Singleton hoạt động
-   [ ] Biết phân biệt local state vs global state
-   [ ] Hiểu flow dữ liệu từ Parent → Child
-   [ ] Biết cách dữ liệu được giữ khi chuyển tab
-   [ ] Có thể mở rộng thêm tính năng mới

---

**📌 Lưu ý cuối cùng:**

Đây là kiến trúc đơn giản cho app nhỏ. Với app lớn hơn, nên dùng:

-   **Provider** / **Riverpod** cho state management
-   **Repository Pattern** cho data layer
-   **BLoC** / **GetX** cho complex logic

Nhưng hiểu rõ cách này sẽ giúp bạn nắm vững nền tảng! 🚀
