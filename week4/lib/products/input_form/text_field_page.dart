import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Basic TextField:'),
            TextField(),

            SizedBox(height: 20),
            Text('TextField with hint:'),
            TextField(decoration: InputDecoration(hintText: 'Enter your name')),

            SizedBox(height: 20),
            Text('TextField with label & icon:'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            Text('TextField with border styles:'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            Text('Multiline TextField:'),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            Text('TextField with suffix icon:'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),

            SizedBox(height: 20),
            Text('TextField with custom style:'),
            TextField(
              style: TextStyle(color: Colors.blue, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Styled Input',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
