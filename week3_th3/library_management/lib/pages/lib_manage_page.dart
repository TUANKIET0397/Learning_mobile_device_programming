import 'package:flutter/material.dart';
import 'package:library_management/pages/books_manage_page.dart';
import 'package:library_management/pages/home_page.dart';
import 'package:library_management/pages/users_page.dart';

class LibManagePage extends StatefulWidget {
  const LibManagePage({super.key});

  @override
  State<LibManagePage> createState() => _LibManagePageState();
}

class _LibManagePageState extends State<LibManagePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [HomePage(), BookManagePage(), UsersPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 87, 84, 84), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(size: 42),
          unselectedIconTheme: const IconThemeData(size: 34),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'DS Sách',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Sinh viên',
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:library_management/pages/books_manage_page.dart';
// import 'package:library_management/pages/users_page.dart';

// class LibManagePage extends StatefulWidget {
//   const LibManagePage({super.key});

//   @override
//   State<LibManagePage> createState() => _LibManagePageState();
// }

// class _LibManagePageState extends State<LibManagePage> {
//   int _selectedIndex = 0;
//   // Danh sách các màn hình tương ứng với icon
//   final List<Widget> _pages = [
//     const Center(child: HomePage()),
//     const Center(child: BookManagePage()),
//     const Center(child: UsersPage()),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed, // kiểu hiển thị (fixed/shifting)
//         backgroundColor: Colors.white, // màu nền
//         selectedItemColor: Colors.blue, // màu icon/text khi chọn
//         unselectedItemColor: Colors.grey, // màu icon/text khi chưa chọn
//         showSelectedLabels: true, // có hiển thị label khi chọn
//         showUnselectedLabels: true, // có hiển thị label khi chưa chọn
//         elevation: 8,
//         selectedIconTheme: const IconThemeData(size: 32), // icon lớn khi chọn
//         unselectedIconTheme: const IconThemeData(size: 24),
//         // icon nhỏ khi chưa chọn
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.description),
//             label: 'DS Sách',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Sinh viên'),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController _nameController = TextEditingController(
//     text: 'Nguyen Van A',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Text(
//             'Hệ thống\nQuản lý Thư viện',
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Sinh viên',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 10,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final newName = _nameController.text;
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Tên đã thay đổi: $newName'),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.black,
//                           backgroundColor: Color.fromRGBO(14, 83, 177, 1),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 24,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),

//                         child: const Text('Thay đổi'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [],
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(minimumSize: const Size(200, 45)),
//             child: const Text('Thêm'),
//           ),
//         ],
//       ),
//     );
//   }
// }
