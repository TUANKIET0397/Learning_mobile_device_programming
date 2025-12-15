import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực hành 02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const NumberInputScreen(),
    );
  }
}

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  // Controller để quản lý nội dung trong ô nhập liệu
  final TextEditingController _controller = TextEditingController();

  // Biến lưu số lượng ô cần hiển thị (mặc định là 0)
  int _numberOfBoxes = 0;

  // Biến lưu thông báo lỗi (nếu có)
  String? _errorMessage;

  // Hàm xử lý khi người dùng nhấn nút "Tạo"
  void _handleCreate() {
    // Lấy giá trị người dùng nhập vào và loại bỏ khoảng trắng thừa
    String input = _controller.text.trim();

    // Reset thông báo lỗi về null trước khi kiểm tra
    setState(() {
      _errorMessage = null;
    });

    // TRƯỜNG HỢP 1: Kiểm tra nếu ô input rỗng (không nhập gì)
    if (input.isEmpty) {
      setState(() {
        _errorMessage = 'Dữ liệu bạn nhập không hợp lệ'; // Hiển thị lỗi
        _numberOfBoxes = 0; // Xóa hết các ô cũ, về 0 ô
      });
      return; // Dừng hàm, không thực hiện tiếp
    }

    // TRƯỜNG HỢP 2: Thử chuyển đổi input thành số nguyên
    int? number = int.tryParse(input);

    // Nếu không chuyển được (input là chữ hoặc ký tự đặc biệt)
    if (number == null) {
      setState(() {
        _errorMessage = 'Dữ liệu bạn nhập không hợp lệ'; // Hiển thị lỗi
        _numberOfBoxes = 0; // Xóa hết các ô cũ, về 0 ô
      });
      return; // Dừng hàm
    }

    // TRƯỜNG HỢP 3: Input hợp lệ (là số)
    setState(() {
      _numberOfBoxes = number; // Cập nhật số lượng ô = số vừa nhập
      // VÍ DỤ: nhập 5 → hiển thị 5 ô (xóa hết ô cũ)
      //        nhập 10 → hiển thị 10 ô (xóa hết ô cũ)
      //        nhập 1 → hiển thị 1 ô (xóa hết ô cũ)
    });
  }

  @override
  void dispose() {
    // Giải phóng bộ nhớ của controller khi widget bị hủy
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh AppBar phía trên màn hình
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Tiêu đề "Thực hành 02"
              const Text(
                'Thực hành 02',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 32),

              // Hàng ngang chứa ô nhập liệu và nút "Tạo"
              Row(
                children: [
                  // Ô nhập liệu (TextField)
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _controller, // Gắn controller
                        keyboardType: TextInputType.number, // Bàn phím số
                        decoration: const InputDecoration(
                          hintText: 'Nhập vào số lượng',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        // Khi nhấn Enter trên bàn phím → gọi hàm _handleCreate
                        onSubmitted: (_) => _handleCreate(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Nút "Tạo"
                  ElevatedButton(
                    onPressed: _handleCreate, // Khi nhấn nút → gọi hàm _handleCreate
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Tạo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Hiển thị thông báo lỗi (chỉ hiển thị khi có lỗi)
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    _errorMessage!, // Hiển thị nội dung lỗi
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              // Phần hiển thị các ô đỏ (số lượng = _numberOfBoxes)
              Expanded(
                child: ListView.builder(
                  itemCount: _numberOfBoxes, // Số lượng ô = số người dùng nhập
                  itemBuilder: (context, index) {
                    // Mỗi ô trong danh sách
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.red[400], // Màu đỏ
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          // Hiển thị số thứ tự: 1, 2, 3, 4, ...
                          child: Text(
                            '${index + 1}', // index bắt đầu từ 0 nên +1
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}