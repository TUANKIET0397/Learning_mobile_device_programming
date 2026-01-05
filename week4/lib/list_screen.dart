import 'package:flutter/material.dart';
import 'package:week4/products/InteractionE/button_page.dart';
import 'package:week4/products/InteractionE/catch_event_page.dart';
import 'package:week4/products/StylingE/clip_page.dart';
import 'package:week4/products/StylingE/decor_page.dart';
import 'package:week4/products/StylingE/theme_page.dart';
import 'package:week4/products/icon_page.dart';
import 'package:week4/products/image_page.dart';
import 'package:week4/products/input_form/password_field_page.dart';
import 'package:week4/products/input_form/text_field_page.dart';
import 'package:week4/products/input_form/text_form_field_page.dart';
import 'package:week4/products/layoutE/arrange_page.dart';
import 'package:week4/products/layoutE/container_page.dart';
import 'package:week4/products/layoutE/stack_page.dart';
import 'package:week4/products/navigationE/app_bar_page.dart';
import 'package:week4/products/navigationE/bottom_navigation_bar_page.dart';
import 'package:week4/products/navigationE/drawer_page.dart';
import 'package:week4/products/text_page.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'UI Components List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(33, 150, 243, 1),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display:RichText, Card, Chip, Tooltip, ProgressIndicator
            const Text(
              'Display',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            _itemButton('Text', 'Displays text', context, const TextPage()),
            _itemButton(
              'Image',
              'Displays an Image',
              context,
              const ImagePage(),
            ),
            _itemButton('Icon', 'Displays an Icon', context, const IconPage()),
            const SizedBox(height: 18),
            // Input:Checkbox, Radio, Switch, Slider, DropdownButton,DatePicker / TimePicker
            const Text(
              'Input',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _itemButton(
              'TextField',
              'Input field for text',
              context,
              const TextFieldPage(),
            ),
            _itemButton(
              'PasswordField',
              'Input field for passwords',
              context,
              const PasswordFieldPage(),
            ),
            _itemButton(
              'TextFormField',
              'Input field for TextForm',
              context,
              const TextFormFieldPage(),
            ),
            // Layout: Expanded / Flexible, GridView, Padding / Margin (EdgeInsets), Align / Center
            const Text(
              'Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _itemButton(
              'Container',
              'Container with basic frame',
              context,
              const ContainerPage(),
            ),
            _itemButton(
              'Row & Column',
              'Arrange horizontally/vertically',
              context,
              const ArrangePage(),
            ),
            _itemButton(
              'Stack',
              'Overlay widgets on top of each other',
              context,
              const StackPage(),
            ),
            //Navigation: TabBar / TabBarView, Navigator / Routes
            const Text(
              'Navigation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _itemButton('AppBar', 'Top title bar', context, const AppBarPage()),
            _itemButton(
              'BottomNavigationBar',
              'Bottom title bar',
              context,
              const BottomNavigationBarPage(),
            ),
            _itemButton(
              'Drawer',
              'Menu slides from the edge',
              context,
              const DrawerPage(),
            ),
            // Interaction
            const Text(
              'Interaction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _itemButton(
              'Button',
              'Types of buttons',
              context,
              const ButtonPage(),
            ),
            _itemButton(
              'Catch Event',
              'Catch touch, drag, and swipe events',
              context,
              const CatchEventPage(),
            ),
            //Styling
            const Text(
              'Styling',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _itemButton(
              'Theme/ThemeData',
              'Manage colors and fonts',
              context,
              const ThemePage(),
            ),
            _itemButton(
              'DecoratedBox/BoxDecoration',
              'Manage background, border, gradient',
              context,
              const DecorPage(),
            ),
            _itemButton(
              'ClipRRect/ClipOval',
              'Manage round corners, cut shapes',
              context,
              const ClipPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemButton(
    String title,
    String subtitle,
    BuildContext context,
    Widget page,
  ) {
    return InkWell(
      //có thể dùng GestureDetector custom cụ thể
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: const Color.fromARGB(96, 47, 130, 174), // màu splash
      highlightColor: const Color.fromARGB(111, 9, 144, 193), // màu khi giữ lâu

      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
        margin: EdgeInsets.only(top: 14),
        decoration: BoxDecoration(
          color: Color.fromRGBO(33, 150, 243, 0.3),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
