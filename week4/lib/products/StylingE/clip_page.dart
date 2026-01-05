import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  const ClipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ClipRRect (bo góc):'),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/200',
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text('ClipOval (hình tròn/oval):'),
            ClipOval(
              child: Image.network(
                'https://picsum.photos/200',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text('ClipPath (custom shape):'),
            ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: 200,
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Triangle Clip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('ClipRect (cắt theo hình chữ nhật):'),
            SizedBox(
              width: 200,
              height: 150,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Image.network(
                    'https://picsum.photos/200',
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
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

// Custom clipper cho ClipPath
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
