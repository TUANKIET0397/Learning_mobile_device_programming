import 'package:flutter/material.dart';

class Login extends ConsumerStatefulWidget {
  //
  const Login({super.key});

  @override
  ConsumerState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  // 1 Tạo một bộ điều khiển văn bản cho trường email
  final _emailController = TextEditingController();
  // 2 Tạo một bộ điều khiển văn bản cho trường mật khẩu
  final _passwordController = TextEditingController();
  // 3 Tạo một khóa cần thiết cho biểu mẫu.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void dispose() {
    // 4 Vứt bỏ các bộ điều khiển chỉnh sửa.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // TODO: Add build
  @override
  Widget build(BuildContext context) {
    // 1 Sử dụng ref của Riverpod để theo dõi những thay đổi xảy ra trong UserDao.
    final auth = ref.read(authProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        // 2 Tạo biểu mẫu với khóa toàn cục.
        child: Form(
          key: _formKey,
          // TODO: Add Column & Email
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                // 1 Tạo trường cho địa chỉ email.
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Email Address',
                  ),
                  autofocus: false,
                  // 2 Sử dụng kiểu bàn phím địa chỉ email
                  keyboardType: TextInputType.emailAddress,
                  // 3 Tắt chức năng tự động sửa và viết hoa.
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  // 4 Đặt bộ điều khiển chỉnh sửa.
                  controller: _emailController,
                  // 5 Định nghĩa một bộ kiểm tra để kiểm tra các chuỗi rỗng. Bạn có thể sử dụng biểu thức chính quy hoặc bất kỳ loại kiểm tra nào khác nếu muốn.
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Required';
                    }
                    return null;
                  },
                ),
              ),
              // TODO: Add Password
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Password',
                  ),
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Required';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              // TODO: Add Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // 1
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final errorMessage = await auth.login(
                        //
                        _emailController.text,
                        _passwordController.text,
                      );
                      // 2
                      if (errorMessage != null) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            duration: const Duration(milliseconds: 700),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // 3 Đặt nút thứ hai để gọi phương thức signup() và hiển thị bất kỳ thông báo lỗi nào.
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final errorMessage = await auth.signup(
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (errorMessage != null) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              duration: const Duration(milliseconds: 700),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
              // TODO: Add parentheses
            ],
          ),
        ),
      ),
    );
  }
}
