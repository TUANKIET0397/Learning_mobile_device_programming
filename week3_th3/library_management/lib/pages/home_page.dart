import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Nguyen Van C',
  );

  final List<String> borrowedBooks = []; // chuẩn bị cho màn hình sau

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

          /// ===== SINH VIÊN =====
          _sectionTitle('Sinh viên'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
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
              _primaryButton(
                text: 'Thay đổi',

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tên đã thay đổi: ${_nameController.text}'),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// ===== DANH SÁCH SÁCH =====
          _sectionTitle('Danh sách sách'),
          _borrowedBooksBox(),

          const SizedBox(height: 24),

          _primaryButton(
            text: 'Thêm',
            width: 200,
            onPressed: () {
              setState(() {
                borrowedBooks.add('Sách ${borrowedBooks.length + 1}');
              });
            },
          ),
        ],
      ),
    );
  }

  // ===== WIDGET TÁI SỬ DỤNG =====

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
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _borrowedBooksBox() {
    return Container(
      width: double.infinity,
      height: 260, // fixed
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: borrowedBooks.isEmpty
          ? const Center(
              child: Text(
                'Bạn chưa mượn quyển sách nào\n'
                'Nhấn "Thêm" để bắt đầu hành trình đọc sách!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: borrowedBooks.length,
              itemBuilder: (context, index) {
                final book = borrowedBooks[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CheckboxListTile(
                    value: true,
                    onChanged: (v) {},
                    title: Text(book),
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
