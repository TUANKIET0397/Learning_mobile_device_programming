import 'package:flutter/material.dart';

class ArrangePage extends StatelessWidget {
  const ArrangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrange Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row (ngang):'),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.red),
                Icon(Icons.star, color: Colors.green),
                Icon(Icons.star, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 20),

            const Text('Column (dọc):'),
            Column(
              children: const [
                Icon(Icons.circle, color: Colors.orange),
                Icon(Icons.circle, color: Colors.purple),
                Icon(Icons.circle, color: Colors.teal),
              ],
            ),
            const SizedBox(height: 20),

            const Text('Expanded trong Row:'),
            Row(
              children: [
                Expanded(child: Container(color: Colors.red, height: 50)),
                Expanded(child: Container(color: Colors.green, height: 50)),
                Expanded(child: Container(color: Colors.blue, height: 50)),
              ],
            ),
            const SizedBox(height: 20),

            const Text('Flexible trong Column:'),
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Flexible(child: Container(color: Colors.pink)),
                  Flexible(child: Container(color: Colors.yellow)),
                  Flexible(child: Container(color: Colors.cyan)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('Align & Center:'),
            SizedBox(
              width: 200,
              height: 100,
              child: Stack(
                children: const [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.star, color: Colors.red),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.star, color: Colors.blue),
                  ),
                  Center(
                    child: Icon(Icons.star, color: Colors.green, size: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
