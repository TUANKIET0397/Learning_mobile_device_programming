import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Default Text'),
            SizedBox(height: 12),

            Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            Text('Italic Text', style: TextStyle(fontStyle: FontStyle.italic)),
            SizedBox(height: 12),

            Text('Colored Text', style: TextStyle(color: Colors.red)),
            SizedBox(height: 12),

            Text('Large Font Size', style: TextStyle(fontSize: 30)),
            SizedBox(height: 12),

            Text('Custom Font Family', style: TextStyle(fontFamily: 'Courier')),
            SizedBox(height: 12),

            Text('Letter Spacing Example', style: TextStyle(letterSpacing: 4)),
            SizedBox(height: 12),

            Text('Word Spacing Example', style: TextStyle(wordSpacing: 10)),
            SizedBox(height: 12),

            Text(
              'Underlined Text',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            SizedBox(height: 12),

            Text(
              'Strikethrough Text',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(height: 12),

            Text(
              'Shadow Text',
              style: TextStyle(
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            Text('Text Align Center', textAlign: TextAlign.center),
            SizedBox(height: 12),

            Text('Text Align Right', textAlign: TextAlign.right),
            SizedBox(height: 12),

            Text(
              'Overflow Ellipsis - This is a very long text that will be truncated...',
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12),

            Text(
              'Max Lines = 2\nThis is a long text that will be cut after 2 lines',
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}

// RichText
// Card
// Chip
// Tooltip
// ProgressIndicator
