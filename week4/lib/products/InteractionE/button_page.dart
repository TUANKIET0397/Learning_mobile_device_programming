import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ElevatedButton:'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ElevatedButton pressed')),
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),

            const Text('TextButton:'),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TextButton pressed')),
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),

            const Text('OutlinedButton:'),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OutlinedButton pressed')),
                );
              },
              child: const Text('Click Me'),
            ),
            const SizedBox(height: 20),

            const Text('IconButton:'),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              color: Colors.blue,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('IconButton pressed')),
                );
              },
            ),
            const SizedBox(height: 20),

            const Text('FloatingActionButton:'),
            const Text('Nút này thường nằm ở góc dưới bên phải Scaffold'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FloatingActionButton pressed')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
