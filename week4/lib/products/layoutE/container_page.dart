import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Basic Container:'),
            Container(width: 100, height: 100, color: Colors.blue),
            const SizedBox(height: 20),

            const Text('Container with padding & margin:'),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              color: Colors.green,
              child: const Text('Padding + Margin'),
            ),
            const SizedBox(height: 20),

            const Text('Container with border & rounded corners:'),
            Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('Border + Radius')),
            ),
            const SizedBox(height: 20),

            const Text('Container with gradient:'),
            Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'Gradient Background',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Container with shadow:'),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.yellow,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Center(child: Text('Shadow Effect')),
            ),
            const SizedBox(height: 20),

            const Text('Container with image background:'),
            Container(
              width: 250,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: Text(
                    'Overlay Text',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
