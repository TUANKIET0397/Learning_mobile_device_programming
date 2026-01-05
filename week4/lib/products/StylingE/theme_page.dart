import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Áp dụng theme toàn cục
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Theme Components Demo')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Text sử dụng theme bodyMedium'),
              const SizedBox(height: 12),

              Text(
                'Text sử dụng theme titleLarge',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),

              const Text('ElevatedButton sử dụng theme:'),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button pressed')),
                  );
                },
                child: const Text('Click Me'),
              ),
              const SizedBox(height: 20),

              const Text('Icon sử dụng màu từ theme:'),
              Icon(Icons.star, color: Theme.of(context).primaryColor, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}
