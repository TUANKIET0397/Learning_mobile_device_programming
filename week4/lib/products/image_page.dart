import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Image.asset (local image):'),
            Image.asset('assets/logo/logo.png', width: 100, height: 100),
            const SizedBox(height: 20),

            const Text('Image.network (load từ internet):'),
            Image.network(
              'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
              width: 200,
            ),
            const SizedBox(height: 20),

            const Text('Image với BoxFit.cover:'),
            Image.network(
              'https://picsum.photos/250?image=9',
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            const Text('Image với BoxFit.contain:'),
            Image.network(
              'https://picsum.photos/250?image=10',
              width: 250,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            const Text('Image với ClipRRect (bo góc):'),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/250?image=11',
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text('CircleAvatar với Image:'),
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 20),

            const Text('FadeInImage (placeholder + network):'),
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.png',
              image: 'https://picsum.photos/250?image=12',
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
