// Import thư viện Material Design của Flutter
import 'package:flutter/material.dart';

// Hàm main - điểm khởi đầu của ứng dụng Flutter
void main() {
  // runApp() khởi chạy ứng dụng với widget gốc
  runApp(const CalculatorApp());
}

// CalculatorApp - Widget gốc của ứng dụng
// StatelessWidget: widget không thay đổi trạng thái
class CalculatorApp extends StatelessWidget {
  // Constructor với key để Flutter quản lý widget tree
  const CalculatorApp({Key? key}) : super(key: key);

  // build() - phương thức bắt buộc để vẽ giao diện
  @override
  Widget build(BuildContext context) {
    // MaterialApp - widget cơ bản cho ứng dụng Material Design
    return MaterialApp(
      title: 'Calculator', // Tiêu đề ứng dụng
      debugShowCheckedModeBanner: false, // Tắt banner "Debug" ở góc phải
      theme: ThemeData(
        primarySwatch: Colors.blue, // Màu chủ đạo của app
        scaffoldBackgroundColor: Colors.white, // Màu nền toàn app
      ),
      home: const CalculatorScreen(), // Màn hình chính đầu tiên
    );
  }
}

// CalculatorScreen - Màn hình chính chứa calculator
// StatefulWidget: widget có thể thay đổi trạng thái (state)
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  // createState() - tạo object State để quản lý trạng thái
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

// _CalculatorScreenState - Class quản lý trạng thái của CalculatorScreen
// Dấu _ (underscore) = private, chỉ dùng trong file này
class _CalculatorScreenState extends State<CalculatorScreen> {
  // TextEditingController - quản lý nội dung của TextField
  // Controller cho số thứ nhất
  final TextEditingController _firstController = TextEditingController();
  // Controller cho số thứ hai
  final TextEditingController _secondController = TextEditingController();

  // Biến lưu kết quả tính toán (kiểu String để hiển thị)
  String _result = '';
  // Biến lưu phép toán được chọn (+, -, *, /)
  String _selectedOperation = '';

  // Hàm tính toán - thực hiện phép toán dựa vào operation được chọn
  void _calculate(String operation) {
    // setState() - báo cho Flutter biết state thay đổi, cần vẽ lại UI
    setState(() {
      // Lưu phép toán hiện tại
      _selectedOperation = operation;

      // tryParse() - chuyển String thành double, trả về null nếu không hợp lệ
      // Lấy số từ TextField thứ nhất
      final double? num1 = double.tryParse(_firstController.text);
      // Lấy số từ TextField thứ hai
      final double? num2 = double.tryParse(_secondController.text);

      // Kiểm tra nếu một trong hai số không hợp lệ (null)
      if (num1 == null || num2 == null) {
        _result = ''; // Reset kết quả về rỗng
        return; // Thoát khỏi hàm
      }

      // Biến lưu kết quả tính toán
      double calculatedResult = 0;

      // switch-case - kiểm tra phép toán và thực hiện tính toán tương ứng
      switch (operation) {
        case '+': // Phép cộng
          calculatedResult = num1 + num2;
          break; // Thoát khỏi switch
        case '-': // Phép trừ
          calculatedResult = num1 - num2;
          break;
        case '*': // Phép nhân
          calculatedResult = num1 * num2;
          break;
        case '/': // Phép chia
          if (num2 == 0) { // Kiểm tra chia cho 0
            _result = 'Error'; // Hiển thị lỗi
            return; // Thoát khỏi hàm
          }
          calculatedResult = num1 / num2;
          break;
      }

      // Format kết quả: loại bỏ phần thập phân nếu là số nguyên
      // Ví dụ: 8.0 -> 8, nhưng 8.5 vẫn giữ nguyên
      if (calculatedResult == calculatedResult.toInt()) {
        // toInt() chuyển double thành int
        // toString() chuyển int thành String
        _result = calculatedResult.toInt().toString();
      } else {
        // Giữ nguyên số thập phân
        _result = calculatedResult.toString();
      }
    });
  }

  // Hàm tạo nút phép toán - trả về Widget nút bấm
  // required: tham số bắt buộc phải truyền vào
  Widget _buildOperationButton({
    required String symbol, // Ký hiệu phép toán (+, -, *, /)
    required Color color, // Màu của nút
    required VoidCallback onPressed, // Hàm được gọi khi nhấn nút
  }) {
    // Container - widget cơ bản để tạo hộp chứa
    return Container(
      width: 60, // Chiều rộng nút
      height: 60, // Chiều cao nút
      // BoxDecoration - trang trí cho Container
      decoration: BoxDecoration(
        color: color, // Màu nền
        borderRadius: BorderRadius.circular(15), // Bo góc 15px
      ),
      // Material - widget Material Design cho hiệu ứng ripple
      child: Material(
        color: Colors.transparent, // Màu trong suốt
        // InkWell - tạo hiệu ứng khi nhấn (ripple effect)
        child: InkWell(
          borderRadius: BorderRadius.circular(15), // Bo góc cho ripple
          onTap: onPressed, // Gọi hàm khi nhấn
          // Center - căn giữa child bên trong
          child: Center(
            // Text - hiển thị chữ
            child: Text(
              symbol, // Nội dung text (ký hiệu phép toán)
              // TextStyle - định dạng text
              style: const TextStyle(
                color: Colors.white, // Màu chữ trắng
                fontSize: 28, // Cỡ chữ
                fontWeight: FontWeight.w500, // Độ đậm chữ (500 = medium)
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Hàm tạo ô nhập liệu - trả về Widget TextField
  Widget _buildTextField(TextEditingController controller) {
    // Container để trang trí TextField
    return Container(
      // BoxDecoration - tạo viền và bo góc
      decoration: BoxDecoration(
        color: Colors.grey[100], // Màu nền xám nhạt
        borderRadius: BorderRadius.circular(25), // Bo góc 25px
        border: Border.all(color: Colors.grey[300]!), // Viền xám (! = chắc chắn không null)
      ),
      // TextField - ô nhập liệu
      child: TextField(
        controller: controller, // Gắn controller để quản lý nội dung
        // keyboardType - loại bàn phím hiển thị
        keyboardType: const TextInputType.numberWithOptions(decimal: true), // Bàn phím số có dấu thập phân
        textAlign: TextAlign.left, // Căn trái text
        style: const TextStyle(fontSize: 18), // Cỡ chữ 18
        // InputDecoration - trang trí cho TextField
        decoration: const InputDecoration(
          // contentPadding - khoảng cách padding bên trong
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: InputBorder.none, // Không hiển thị viền mặc định
        ),
        // onChanged - callback khi nội dung thay đổi
        onChanged: (value) {
          // Nếu đã chọn phép toán rồi thì tính lại khi số thay đổi
          if (_selectedOperation.isNotEmpty) {
            _calculate(_selectedOperation); // Gọi hàm tính toán
          }
        },
      ),
    );
  }

  // build() - vẽ giao diện chính của màn hình
  @override
  Widget build(BuildContext context) {
    // Scaffold - cấu trúc cơ bản của màn hình (có AppBar, Body)
    return Scaffold(
      // AppBar - thanh tiêu đề phía trên
      appBar: AppBar(
        // Text - tiêu đề hiển thị
        title: const Text(
          'Thực hành 03',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white, // Màu nền AppBar
        elevation: 0, // Độ cao bóng (0 = không có bóng)
        centerTitle: true, // Căn giữa tiêu đề
      ),
      // body - nội dung chính của màn hình
      body: Padding(
        // Padding - tạo khoảng cách xung quanh
        padding: const EdgeInsets.all(24.0), // 24px mỗi cạnh
        // Column - sắp xếp các widget theo chiều dọc
        child: Column(
          children: [
            const SizedBox(height: 20), // Khoảng trống 20px

            // TextField thứ nhất (số thứ nhất)
            _buildTextField(_firstController),

            const SizedBox(height: 20), // Khoảng trống 20px

            // Row - sắp xếp các widget theo chiều ngang
            // Chứa 4 nút phép toán
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa
              children: [
                // Nút phép cộng (+) màu đỏ
                _buildOperationButton(
                  symbol: '+',
                  color: Colors.red,
                  onPressed: () => _calculate('+'), // Arrow function gọi _calculate
                ),
                const SizedBox(width: 12), // Khoảng cách ngang 12px
                // Nút phép trừ (-) màu cam
                _buildOperationButton(
                  symbol: '-',
                  color: Colors.orange,
                  onPressed: () => _calculate('-'),
                ),
                const SizedBox(width: 12),
                // Nút phép nhân (*) màu tím
                _buildOperationButton(
                  symbol: '*',
                  color: Colors.purple,
                  onPressed: () => _calculate('*'),
                ),
                const SizedBox(width: 12),
                // Nút phép chia (/) màu đen
                _buildOperationButton(
                  symbol: '/',
                  color: Colors.black87,
                  onPressed: () => _calculate('/'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // TextField thứ hai (số thứ hai)
            _buildTextField(_secondController),

            const SizedBox(height: 20),

            // Container hiển thị kết quả
            Container(
              width: double.infinity, // Chiều rộng full màn hình
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                // Toán tử ternary (? :) - if else ngắn gọn
                // Nếu _result rỗng thì hiển thị "Kết quả:", ngược lại hiển thị "Kết quả: $_result"
                _result.isEmpty ? 'Kết quả:' : 'Kết quả: $_result',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // dispose() - giải phóng bộ nhớ khi widget bị xóa
  // Rất quan trọng để tránh memory leak
  @override
  void dispose() {
    // Hủy controller để giải phóng bộ nhớ
    _firstController.dispose();
    _secondController.dispose();
    super.dispose(); // Gọi dispose của class cha
  }
}