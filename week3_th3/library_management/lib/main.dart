import 'package:flutter/material.dart';
import 'package:library_management/pages/lib_manage_page.dart';
import 'package:library_management/theme/app_theme.dart';

void main() => runApp(const LibManage());

class LibManage extends StatelessWidget {
  const LibManage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management',
      theme: AppTheme.lightTheme,
      home: const SafeArea(child: LibManagePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
