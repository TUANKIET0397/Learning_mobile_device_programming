import 'package:flutter/material.dart';

class LazyColumnTest extends StatelessWidget {
  const LazyColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LazyColumn Test')),
      body: ListView.builder(
        itemCount: 1000000,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item ${index + 1}'));
        },
      ),
    );
  }
}
