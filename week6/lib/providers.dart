// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'models/user_dao.dart';
// import 'components/message.dart';
// import 'models/message_dao.dart';

// // 1 UserDao mở rộng ChangeNotifier; sử dụng ChangeNotifierProvider để cung cấp một tình trạng của UserDao.
// final userDaoProvider = ChangeNotifierProvider<UserDao>((ref) {
//   return UserDao();
// });

// // TODO: Add messageDaoProvider
// final messageDaoProvider = Provider<MessageDao>((ref) {
//   return MessageDao(ref.watch(userDaoProvider));
// });
// // TODO: Add messageListProvider
// final messageListProvider = StreamProvider<List<Message>>((ref) {
//   final messageDao = ref.watch(messageDaoProvider);
//   return messageDao.getMessageStream();
// });
