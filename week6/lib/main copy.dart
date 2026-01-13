// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learning_flutter_basic/firebase_options.dart';
// import 'package:learning_flutter_basic/home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int tab = 1;

//   final pages = [
//     const Scaffold(backgroundColor: Colors.red),
//     Scaffold(body: Home()),
//     const Scaffold(backgroundColor: Colors.blue),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: IndexedStack(index: tab, children: pages),
//         bottomNavigationBar: NavigationBar(
//           selectedIndex: tab,
//           onDestinationSelected: (index) {
//             setState(() => tab = index);
//           },
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Icons.credit_card),
//               label: 'Category',
//             ),
//             NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Chat'),
//             NavigationDestination(
//               icon: Icon(Icons.credit_card),
//               label: 'Restaurant',
//             ),
//           ],
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
