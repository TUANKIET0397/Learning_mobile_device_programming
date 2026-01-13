// import 'package:cloud_firestore/cloud_firestore.dart';

// class Message {
//   Message({
//     required this.date,
//     required this.email,
//     required this.text,
//     this.reference,
//   });
//   final DateTime date;
//   final String email;
//   final String text;
//   DocumentReference? reference;
//   // TODO: Add JSON converters
//   // 1 Điều này chuyển đổi JSON nhận được từ Cloud Firestore thành một Tin nhắn.
//   factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
//     date: (json['date'] as Timestamp).toDate(),
//     email: json['email'] as String,
//     text: json['text'] as String,
//   );
//   // 2 Điều này làm ngược lại — chuyển đổi Message thành JSON để lưu
//   Map<String, dynamic> toJson() => <String, dynamic>{
//     'date': date,
//     'email': email,
//     'text': text,
//   };
//   // TODO: Add fromSnapshot
//   factory Message.fromSnapshot(DocumentSnapshot snapshot) {
//     // 1 Điều này lấy một snapshot của Firestore và chuyển nó thành một tin nhắn bằng cách sử dụng fromJson().
//     final message = Message.fromJson(snapshot.data() as Map<String, dynamic>);
//     // 2 Đặt thuộc tính tham chiếu
//     message.reference = snapshot.reference;
//     return message;
//   }
// }
