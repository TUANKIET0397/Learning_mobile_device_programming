// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// // 1
// class UserDao extends ChangeNotifier {
//   String errorMsg = 'An error has occurred.';
//   // 2
//   final auth = FirebaseAuth.instance; //giữ một trường hợp của FirebaseAuth

//   // TODO: Add helper methods
//   // 1
//   bool isLoggedIn() {
//     //Trả về true nếu người dùng đã đăng nhập. Nếu người dùng hiện tại là null, họ đã đăng xuất
//     return auth.currentUser != null;
//   }

//   // 2
//   String? userId() {
//     //Trả về ID của người dùng hiện tại, có thể là null.
//     return auth.currentUser?.uid;
//   }

//   //3
//   String? email() {
//     //Trả về email của người dùng hiện tại.
//     return auth.currentUser?.email;
//   }

//   // TODO: Add signup
//   //1 Nhập email và mật khẩu mà người dùng đã nhập. Đối với một ứng dụng thực, bạn sẽ cần đảm bảo rằng các chuỗi đó đáp ứng các yêu cầu của bạn. Trả về thông báo lỗi nếu cần.
//   Future<String?> signup(String email, String password) async {
//     try {
//       // 2 Gọi phương thức Firebase, phương thức này tạo một tài khoản mới bằng email và mật khẩu
//       await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       // 3 Thông báo cho tất cả người nghe để họ có thể kiểm tra khi có người dùng đăng nhập
//       notifyListeners();
//       return null;
//     } on FirebaseAuthException catch (e) {
//       // 4 Xử lý một số lỗi phổ biến.
//       if (email.isEmpty) {
//         errorMsg = 'Email is blank.';
//       } else if (password.isEmpty) {
//         errorMsg = 'Password is blank.';
//       } else if (e.code == 'weak-password') {
//         errorMsg = 'The password provided is too weak.';
//       } else if (e.code == 'email-already-in-use') {
//         errorMsg = 'The account already exists for that email.';
//       }
//       return errorMsg;
//     } catch (e) {
//       // 5 Bắt bất kỳ loại ngoại lệ nào khác.
//       log(e.toString());
//       return e.toString();
//     }
//   }

//   // TODO: Add login
//   // 1 Truyền email và mật khẩu mà người dùng đã nhập. Trả về thông báo lỗi nếu cần.
//   Future<String?> login(String email, String password) async {
//     try {
//       // 2 Gọi phương thức Firebase để đăng nhập vào tài khoản của họ.
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//       // 3 Thông báo cho tất cả người nghe.
//       notifyListeners();
//       return null;
//     } on FirebaseAuthException catch (e) {
//       // 4 Xử lý một số lỗi phổ biến.
//       if (email.isEmpty) {
//         errorMsg = 'Email is blank.';
//       } else if (password.isEmpty) {
//         errorMsg = 'Password is blank.';
//       } else if (e.code == 'invalid-email') {
//         errorMsg = 'Invalid email.';
//       } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
//         errorMsg = 'Invalid credentials.';
//       } else if (e.code == 'user-not-found') {
//         errorMsg = 'No user found for that email.';
//       } else if (e.code == 'wrong-password') {
//         errorMsg = 'Wrong password provided for that user.';
//       }
//       return errorMsg;
//     } catch (e) {
//       // 5 Bắt bất kỳ loại ngoại lệ nào khác.
//       log(e.toString());
//       return e.toString();
//     }
//   }

//   // TODO: Add logout
//   void logout() async {
//     await auth.signOut();
//     notifyListeners();
//   }
// }
