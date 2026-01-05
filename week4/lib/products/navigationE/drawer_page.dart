import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
            ListTile(leading: Icon(Icons.info), title: Text('About')),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Swipe from left or tap AppBar to open Drawer',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
