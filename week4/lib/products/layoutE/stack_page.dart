import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Basic Stack (chồng 2 container):'),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(width: 200, height: 200, color: Colors.blue),
                  Container(width: 100, height: 100, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('Stack với Positioned:'),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(color: Colors.green),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Icon(Icons.star, size: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('Stack với Align:'),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(color: Colors.purple),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Icon(Icons.cloud, size: 40, color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.sunny, size: 40, color: Colors.orange),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('Stack overlay text trên ảnh:'),
            SizedBox(
              width: 250,
              height: 150,
              child: Stack(
                children: [
                  Image.network(
                    'https://picsum.photos/250?image=9',
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.3)),
                  const Center(
                    child: Text(
                      'Overlay Text',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
