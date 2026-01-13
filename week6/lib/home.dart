// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learning_flutter_basic/components/message_list.dart';

// import '../components/login.dart';
// import 'providers.dart';

// class Home extends ConsumerWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // thay thế // TODO: Add userDaoProvider
//     final userDao = ref.watch(userDaoProvider);

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('My Chat App - Demo'),
//           elevation: 4.0,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 userDao.logout();
//               },
//               icon: const Icon(Icons.logout),
//             ),
//           ],
//         ),
//         body: Center(
//           // thay thế // TODO: Add Login
//           child: userDao.isLoggedIn() ? MessageList() : const Login(),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
