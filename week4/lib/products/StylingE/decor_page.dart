import 'package:flutter/material.dart';

class DecorPage extends StatelessWidget {
  const DecorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decor Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DecoratedBox với màu nền:'),
            const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Simple background color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('DecoratedBox với border & radius:'),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Border + Radius'),
              ),
            ),
            const SizedBox(height: 20),

            const Text('DecoratedBox với gradient:'),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Gradient Background',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('DecoratedBox với shadow:'),
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.yellow,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('Shadow Effect'),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Opacity (điều chỉnh độ trong suốt):'),
            Opacity(
              opacity: 0.5,
              child: Container(
                width: 150,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    '50% opacity',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Theme (áp dụng màu sắc toàn cục):'),
            Theme(
              data: ThemeData(
                primaryColor: Colors.teal,
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(color: Colors.teal, fontSize: 18),
                ),
              ),
              child: const Text('This text uses Theme styling'),
            ),
          ],
        ),
      ),
    );
  }
}
