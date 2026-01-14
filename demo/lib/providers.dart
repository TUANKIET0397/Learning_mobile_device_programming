import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/message_dao.dart';
import 'components/message.dart';
import 'models/user_dao.dart';

// AUTH STATE
final authProvider = NotifierProvider<AuthNotifier, User?>(
  //
  () => AuthNotifier(),
);

// USER EMAIL (derived state)
final userEmailProvider = Provider<String?>((ref) {
  return ref.watch(authProvider)?.email;
});

// MESSAGE DAO
final messageDaoProvider = Provider<MessageDao>((ref) {
  //
  final email = ref.watch(userEmailProvider);
  return MessageDao(email);
});

// MESSAGE STREAM
final messageListProvider = StreamProvider<List<Message>>((ref) {
  //
  return ref.watch(messageDaoProvider).getMessageStream();
});
