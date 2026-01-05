import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tiêu đề cơ bản
        title: const Text('AppBar Components Demo'),

        // Màu chữ/icon
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),

        // Màu nền
        backgroundColor: Colors.white,

        // Icon bên trái (leading)
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Menu clicked')));
          },
        ),

        // Các action bên phải
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search clicked')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications clicked')),
              );
            },
          ),
        ],

        // Shadow và độ cao
        elevation: 4,

        // Căn giữa tiêu đề
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Basic AppBar with title'),
          SizedBox(height: 20),

          Text('AppBar with leading icon (menu)'),
          SizedBox(height: 20),

          Text('AppBar with actions (search, notifications)'),
          SizedBox(height: 20),

          Text('AppBar with custom background color'),
          SizedBox(height: 20),

          Text('AppBar with elevation (shadow)'),
          SizedBox(height: 20),

          Text('AppBar with centered title'),
        ],
      ),
    );
  }
}
