import 'package:flutter/material.dart';

class CatchEventPage extends StatelessWidget {
  const CatchEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch Event Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('GestureDetector - Tap:'),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Box tapped!')));
              },
              child: Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
            const SizedBox(height: 20),

            const Text('GestureDetector - Double Tap & Long Press:'),
            GestureDetector(
              onDoubleTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Double tapped!')));
              },
              onLongPress: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Long pressed!')));
              },
              child: Container(
                width: 150,
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('Double/Long press me')),
              ),
            ),
            const SizedBox(height: 20),

            const Text('GestureDetector - Drag:'),
            GestureDetector(
              onPanUpdate: (details) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Dragged: ${details.delta}')),
                );
              },
              child: Container(
                width: 150,
                height: 100,
                color: Colors.orange,
                child: const Center(child: Text('Drag me')),
              ),
            ),
            const SizedBox(height: 20),

            const Text('InkWell - Ripple effect:'),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('InkWell tapped!')),
                );
              },
              borderRadius: BorderRadius.circular(12),
              splashColor: Colors.purple.withOpacity(0.3),
              child: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text('InkWell tap me')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
