// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../providers.dart';
// import 'message.dart';

// class MessageWidget extends ConsumerWidget {
//   const MessageWidget(this.message, {super.key});

//   final Message message;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // trang 512
//     final userDao = ref.watch(userDaoProvider);
//     final myMessage = message.email == userDao.email();

//     return Align(
//       alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: myMessage ? Colors.blue[100] : Colors.grey[300],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(message.text, style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 4),
//             Text(
//               DateFormat('hh:mm').format(message.date),
//               style: const TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
