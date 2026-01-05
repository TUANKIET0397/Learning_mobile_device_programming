import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Default Icon:'),
            Icon(Icons.home),

            SizedBox(height: 20),
            Text('Icon with color:'),
            Icon(Icons.favorite, color: Colors.red),

            SizedBox(height: 20),
            Text('Icon with size:'),
            Icon(Icons.star, size: 50),

            SizedBox(height: 20),
            Text('Icon with opacity:'),
            Opacity(
              opacity: 0.5,
              child: Icon(Icons.star, size: 50, color: Colors.blue),
            ),

            SizedBox(height: 20),
            Text('Icon inside CircleAvatar:'),
            CircleAvatar(radius: 30, child: Icon(Icons.person, size: 30)),

            SizedBox(height: 20),
            Text('Icon with background container:'),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.warning, color: Colors.black),
              ),
            ),

            SizedBox(height: 20),
            Text('IconButton (clickable icon):'),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: null, // thay null bằng hàm để xử lý sự kiện
            ),

            SizedBox(height: 20),
            Text('Different style icons:'),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 12),
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 12),
                Icon(Icons.map, color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
