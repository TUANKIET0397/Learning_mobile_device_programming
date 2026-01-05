import 'package:flutter/material.dart';
import 'package:project_class/column.dart';
import 'package:project_class/lazy_column.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ColumnTest(),
                      ),
                    );
                  },
                  child: const Text('Column(1.000.000 items)'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LazyColumnTest(),
                      ),
                    );
                  },
                  child: const Text('LazyColumn(1.000.000 items)'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
