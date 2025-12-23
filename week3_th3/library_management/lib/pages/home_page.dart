// ========================================
// FILE: lib/pages/home_page.dart (THAY THẾ HOÀN TOÀN)
// ========================================
import 'package:flutter/material.dart';
import 'package:library_management/data/library_data.dart';
import 'package:library_management/models/books.dart';
import 'package:library_management/models/student.dart';

class HomePage extends StatefulWidget {
  final LibraryData libraryData;

  const HomePage({super.key, required this.libraryData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  String? _currentStudentName;
  List<Book> _selectedBooks = []; // Sách tạm thời đang chọn (chưa lưu)

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // Khi người dùng thay đổi tên trong TextField
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

      // Load sách của sinh viên nếu đã tồn tại
      if (widget.libraryData.students.containsKey(name.trim())) {
        final student = widget.libraryData.students[name.trim()]!;
        _selectedBooks = LibraryData.availableBooks
            .where((book) => student.borrowedBookIds.contains(book.id))
            .toList();
      } else {
        _selectedBooks = []; // Sinh viên mới chưa có sách
      }
    });
  }

  // Nhấn nút "Thêm" -> Mở dialog chọn sách
  void _showAddBookDialog() {
    if (_currentStudentName == null || _currentStudentName!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên sinh viên trước!')),
      );
      return;
    }

    final selectedIds = _selectedBooks.map((b) => b.id).toSet();
    final availableToAdd = LibraryData.availableBooks
        .where((book) => !selectedIds.contains(book.id))
        .toList();

    if (availableToAdd.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã chọn hết sách rồi!')));
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chọn sách để mượn'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: availableToAdd.length,
            itemBuilder: (context, index) {
              final book = availableToAdd[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                trailing: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.blue,
                ),
                onTap: () {
                  setState(() {
                    _selectedBooks.add(book);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã chọn: ${book.title}')),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  // Nhấn nút "Thay đổi" -> Lưu sách vào sinh viên
  void _saveChanges() {
    if (_currentStudentName == null || _currentStudentName!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên sinh viên!')),
      );
      return;
    }

    // Tạo hoặc cập nhật sinh viên
    final bookIds = _selectedBooks.map((b) => b.id).toList();
    widget.libraryData.students[_currentStudentName!] = Student(
      name: _currentStudentName!,
      borrowedBookIds: bookIds,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đã lưu thay đổi cho $_currentStudentName')),
    );
  }

  // Xóa sách khỏi danh sách tạm
  void _removeBook(Book book) {
    setState(() {
      _selectedBooks.remove(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            'Hệ thống\nQuản lý Thư viện',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // SINH VIÊN
          _sectionTitle('Sinh viên'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  onChanged: _onNameChanged, // ← Tự động load khi gõ
                  decoration: InputDecoration(
                    hintText: 'Nhập tên sinh viên...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _primaryButton(text: 'Thay đổi', onPressed: _saveChanges),
            ],
          ),

          const SizedBox(height: 24),

          // DANH SÁCH SÁCH
          _sectionTitle('Danh sách sách'),
          _borrowedBooksBox(),

          const SizedBox(height: 24),

          _primaryButton(
            text: 'Thêm',
            width: 200,
            onPressed: _showAddBookDialog,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _primaryButton({
    required String text,
    required VoidCallback onPressed,
    double? width,
  }) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(14, 83, 177, 1),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _borrowedBooksBox() {
    return Container(
      width: double.infinity,
      height: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: _currentStudentName == null
          ? Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Vui lòng nhập tên sinh viên\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'để bắt đầu hành trình đọc sách',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          : _selectedBooks.isEmpty
          ? Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Bạn chưa mượn quyển sách nào\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    TextSpan(
                      text: 'Nhấn "Thêm" để bắt đầu hành trình đọc sách!',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _selectedBooks.length,
              itemBuilder: (context, index) {
                final book = _selectedBooks[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CheckboxListTile(
                    value: true,
                    onChanged: (v) {
                      if (v == false) {
                        _removeBook(book);
                      }
                    },
                    title: Text(book.title),
                    activeColor: Colors.red,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
    );
  }
}
