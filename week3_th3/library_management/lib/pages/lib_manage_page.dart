import 'package:flutter/material.dart';
import 'package:library_management/pages/books_manage_page.dart';
import 'package:library_management/pages/users_page.dart';

class LibManagePage extends StatefulWidget {
  const LibManagePage({super.key});

  @override
  State<LibManagePage> createState() => _LibManagePageState();
}

class _LibManagePageState extends State<LibManagePage> {
  int _selectedIndex = 0;
  // Danh sách các màn hình tương ứng với icon
  final List<Widget> _pages = [
    const Center(child: HomePage()),
    const Center(child: BookManagePage()),
    const Center(child: UsersPage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // kiểu hiển thị (fixed/shifting)
        backgroundColor: Colors.white, // màu nền
        selectedItemColor: Colors.blue, // màu icon/text khi chọn
        unselectedItemColor: Colors.grey, // màu icon/text khi chưa chọn
        showSelectedLabels: true, // có hiển thị label khi chọn
        showUnselectedLabels: true, // có hiển thị label khi chưa chọn
        elevation: 8,
        selectedIconTheme: const IconThemeData(size: 32), // icon lớn khi chọn
        unselectedIconTheme: const IconThemeData(size: 24),
        // icon nhỏ khi chưa chọn
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'DS Sách',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Sinh viên'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Nguyen Van A',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'Hệ thống\nQuản lý Thư viện',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sinh viên',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        final newName = _nameController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tên đã thay đổi: $newName')),
                        );
                      },
                      child: const Text('Thay đổi'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Danh sách sách',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: true,
                        onChanged: (v) {},
                        title: const Text('Sách 01'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        value: true,
                        onChanged: (v) {},
                        title: const Text('Sách 02'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(minimumSize: const Size(200, 45)),
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }
}
