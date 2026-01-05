import 'package:flutter/material.dart';

class ColumnTest extends StatelessWidget {
  const ColumnTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Test')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            1000000,
            (index) => ListTile(title: Text('Item ${index + 1}')),
          ),
        ),
      ),
    );
  }
}
