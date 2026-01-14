import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_flutter_basic/components/message.dart';

class MessageDao {
  MessageDao(this.email);
  final String? email;

  final collection = FirebaseFirestore.instance.collection('messages'); //noted

  void sendMessage(String text) {
    if (email == null) return;

    collection.add({'date': DateTime.now(), 'email': email, 'text': text}); //
  }

  Stream<List<Message>> getMessageStream() {
    //
    return collection
        .orderBy('date', descending: true)
        .snapshots()
        .map((s) => s.docs.map(Message.fromSnapshot).toList());
  }
}
