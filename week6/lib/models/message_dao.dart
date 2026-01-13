// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../components/message.dart';
// import 'user_dao.dart';

// class MessageDao {
//   MessageDao(this.userDao);
//   final UserDao userDao;
//   // 1 Lấy một thể hiện của FirebaseFirestore và
//   //sau đó lấy gốc của bộ sưu tập messages bằng cách gọi collection(). Bây giờ, bạn cần MessageDao để thực hiện hai chức năng: lưu và truy xuất.
//   final CollectionReference collection = FirebaseFirestore.instance.collection(
//     'messages',
//   );
//   // TODO: Add saveMessage
//   void sendMessage(String text) {
//     // 1 Tạo một đối tượng Tin nhắn sử dụng Ngày giờ hiện tại, email của người dùng và nội dung tin nhắn của họ dưới dạng văn bản
//     final message = Message(
//       date: DateTime.now(),
//       email: userDao.email()!,
//       text: text,
//     );
//     // 3 add() Thêm chuỗi vào bộ sưu tập. Điều này cập nhật cơ sở dữ liệu ngay lập tức.
//     collection.add(
//       message.toJson(),
//     ); // 2 toJson() chuyển đổi tin nhắn thành chuỗi JSON.
//   }

//   // TODO: Add getMessageStream
//   Stream<List<Message>> getMessageStream() {
//     return collection.orderBy('date', descending: true).snapshots().map((
//       snapshot,
//     ) {
//       return [...snapshot.docs.map(Message.fromSnapshot)];
//     });
//   }
// }
