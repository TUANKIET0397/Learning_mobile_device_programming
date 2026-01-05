import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Components',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const IntroductionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ============================================
// 1️⃣ MÀN HÌNH GIỚI THIỆU
// ============================================
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade400],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Flutter
              Icon(
                Icons.flutter_dash,
                size: 120,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              // Tên ứng dụng
              const Text(
                'Flutter UI Components',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Mô tả
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Ứng dụng học UI Components trong Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Nút bắt đầu
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "I'm ready",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ============================================
// 2️⃣ MÀN HÌNH HOME - DANH SÁCH COMPONENTS
// ============================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components List'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // NHÓM DISPLAY
          _buildCategoryHeader('Display'),
          _buildComponentCard(
            context,
            icon: Icons.text_fields,
            title: 'Text',
            description: 'Displays text',
            detailScreen: const TextDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.image,
            title: 'Image',
            description: 'Displays an image',
            detailScreen: const ImageDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.star,
            title: 'Icon',
            description: 'Displays icons',
            detailScreen: const IconDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM INPUT
          _buildCategoryHeader('Input'),
          _buildComponentCard(
            context,
            icon: Icons.input,
            title: 'TextField',
            description: 'Input field for text',
            detailScreen: const TextFieldDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.lock,
            title: 'PasswordField',
            description: 'Input field for passwords',
            detailScreen: const PasswordFieldDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.check_box,
            title: 'Checkbox',
            description: 'Checkbox for multiple selection',
            detailScreen: const CheckboxDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.radio_button_checked,
            title: 'Radio',
            description: 'Radio buttons for single selection',
            detailScreen: const RadioDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.toggle_on,
            title: 'Switch',
            description: 'Toggle switch on/off',
            detailScreen: const SwitchDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.linear_scale,
            title: 'Slider',
            description: 'Slider for selecting values',
            detailScreen: const SliderDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM BUTTONS
          _buildCategoryHeader('Buttons'),
          _buildComponentCard(
            context,
            icon: Icons.smart_button,
            title: 'ElevatedButton',
            description: 'Button with elevation',
            detailScreen: const ButtonDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.text_snippet,
            title: 'TextButton',
            description: 'Text-style button',
            detailScreen: const TextButtonDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.insert_emoticon,
            title: 'IconButton',
            description: 'Button with icon',
            detailScreen: const IconButtonDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM LAYOUT
          _buildCategoryHeader('Layout'),
          _buildComponentCard(
            context,
            icon: Icons.view_column,
            title: 'Column',
            description: 'Arranges elements vertically',
            detailScreen: const ColumnDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.view_week,
            title: 'Row',
            description: 'Arranges elements horizontally',
            detailScreen: const RowDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.grid_view,
            title: 'GridView',
            description: 'Grid layout of items',
            detailScreen: const GridViewDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.list,
            title: 'ListView',
            description: 'Scrollable list of items',
            detailScreen: const ListViewDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM FEEDBACK
          _buildCategoryHeader('Feedback'),
          _buildComponentCard(
            context,
            icon: Icons.message,
            title: 'Dialog',
            description: 'Pop-up dialog box',
            detailScreen: const DialogDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.notification_important,
            title: 'SnackBar',
            description: 'Brief message at bottom',
            detailScreen: const SnackBarDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.hourglass_empty,
            title: 'ProgressIndicator',
            description: 'Shows loading progress',
            detailScreen: const ProgressIndicatorDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM CONTAINERS
          _buildCategoryHeader('Containers'),
          _buildComponentCard(
            context,
            icon: Icons.credit_card,
            title: 'Card',
            description: 'Material design card',
            detailScreen: const CardDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.square,
            title: 'Container',
            description: 'Box for styling and positioning',
            detailScreen: const ContainerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.padding,
            title: 'Padding',
            description: 'Adds padding around a widget',
            detailScreen: const PaddingDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.expand,
            title: 'Expanded',
            description: 'Expands to fill available space',
            detailScreen: const ExpandedDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.space_bar,
            title: 'SizedBox',
            description: 'Box with fixed size or spacing',
            detailScreen: const SizedBoxDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM NAVIGATION
          _buildCategoryHeader('Navigation'),
          _buildComponentCard(
            context,
            icon: Icons.tab,
            title: 'TabBar',
            description: 'Horizontal tabs navigation',
            detailScreen: const TabBarDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.navigation,
            title: 'BottomNavigationBar',
            description: 'Bottom navigation menu',
            detailScreen: const BottomNavDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.menu,
            title: 'Drawer',
            description: 'Side navigation menu',
            detailScreen: const DrawerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.app_registration,
            title: 'AppBar',
            description: 'Top app bar with title',
            detailScreen: const AppBarDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM FORMS
          _buildCategoryHeader('Forms & Pickers'),
          _buildComponentCard(
            context,
            icon: Icons.arrow_drop_down_circle,
            title: 'DropdownButton',
            description: 'Dropdown selection menu',
            detailScreen: const DropdownDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.calendar_today,
            title: 'DatePicker',
            description: 'Date selection dialog',
            detailScreen: const DatePickerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.access_time,
            title: 'TimePicker',
            description: 'Time selection dialog',
            detailScreen: const TimePickerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.wysiwyg,
            title: 'Form',
            description: 'Form container with validation',
            detailScreen: const FormDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM SCROLLING
          _buildCategoryHeader('Scrolling & Views'),
          _buildComponentCard(
            context,
            icon: Icons.view_carousel,
            title: 'PageView',
            description: 'Swipeable pages',
            detailScreen: const PageViewDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.refresh,
            title: 'RefreshIndicator',
            description: 'Pull to refresh',
            detailScreen: const RefreshIndicatorDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.list_alt,
            title: 'SingleChildScrollView',
            description: 'Makes content scrollable',
            detailScreen: const SingleChildScrollViewDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM IMAGES & MEDIA
          _buildCategoryHeader('Images & Media'),
          _buildComponentCard(
            context,
            icon: Icons.circle,
            title: 'CircleAvatar',
            description: 'Circular image/icon container',
            detailScreen: const CircleAvatarDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.play_circle,
            title: 'AnimatedContainer',
            description: 'Container with animations',
            detailScreen: const AnimatedContainerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.opacity,
            title: 'Opacity',
            description: 'Controls widget transparency',
            detailScreen: const OpacityDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM INFORMATION DISPLAY
          _buildCategoryHeader('Information Display'),
          _buildComponentCard(
            context,
            icon: Icons.label,
            title: 'Chip',
            description: 'Compact information element',
            detailScreen: const ChipDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.badge,
            title: 'Badge',
            description: 'Notification badge',
            detailScreen: const BadgeDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.info,
            title: 'Tooltip',
            description: 'Hint on long press',
            detailScreen: const TooltipDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.vertical_split,
            title: 'Divider',
            description: 'Horizontal line separator',
            detailScreen: const DividerDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.table_chart,
            title: 'Table',
            description: 'Data table widget',
            detailScreen: const TableDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.wrap_text,
            title: 'Wrap',
            description: 'Wraps children to next line',
            detailScreen: const WrapDetailScreen(),
          ),
          
          const SizedBox(height: 20),
          
          // NHÓM GESTURES
          _buildCategoryHeader('Gestures & Interaction'),
          _buildComponentCard(
            context,
            icon: Icons.touch_app,
            title: 'GestureDetector',
            description: 'Detects touch gestures',
            detailScreen: const GestureDetectorDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.apps,
            title: 'InkWell',
            description: 'Touchable with ripple effect',
            detailScreen: const InkWellDetailScreen(),
          ),
          _buildComponentCard(
            context,
            icon: Icons.swipe,
            title: 'Dismissible',
            description: 'Swipe to dismiss item',
            detailScreen: const DismissibleDetailScreen(),
          ),
        ],
      ),
    );
  }

  // Header cho từng nhóm component
  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Card cho mỗi component
  Widget _buildComponentCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Widget detailScreen,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => detailScreen),
          );
        },
      ),
    );
  }
}

// ============================================
// 3️⃣ CÁC MÀN HÌNH CHI TIẾT COMPONENTS
// ============================================

// TEXT DETAIL SCREEN
class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Text Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Text widget dùng để hiển thị văn bản trong Flutter. Bạn có thể tùy chỉnh font, màu sắc, kích thước, và nhiều thuộc tính khác.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Ví dụ 1: Text bình thường
            const Text('The quick Brown fox jumps over the lazy dog.'),
            const SizedBox(height: 15),
            
            // Ví dụ 2: Text với style
            const Text(
              'The quick Brown fox jumps over the lazy dog.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 15),
            
            // Ví dụ 3: Text italic
            const Text(
              'The quick Brown fox jumps over the lazy dog.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 15),
            
            // Ví dụ 4: Text với decoration
            const Text(
              'The quick Brown fox jumps over the lazy dog.',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nText("Nội dung văn bản")\nHoặc thêm style:\nText("Nội dung", style: TextStyle(...))',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// IMAGE DETAIL SCREEN
class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Image Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Image widget dùng để hiển thị hình ảnh từ nhiều nguồn: Internet, Asset (file trong dự án), hoặc bộ nhớ.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            // Ảnh từ Internet
            const Text('🌐 Ảnh từ Internet:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Image.network(
              'https://picsum.photos/400/300',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.error, size: 50)),
                );
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'Image.network("URL")',
              style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            
            const SizedBox(height: 30),
            
            // Ảnh từ Asset (giả lập bằng Icon vì không có asset thật)
            const Text('📁 Ảnh từ Asset:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 80, color: Colors.blue),
                    SizedBox(height: 10),
                    Text('Asset Image Demo', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Image.asset("assets/images/photo.png")',
              style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\n• Image.network() - Tải từ URL\n• Image.asset() - Tải từ file trong dự án\n• Image.memory() - Tải từ bộ nhớ',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// TEXTFIELD DETAIL SCREEN
class TextFieldDetailScreen extends StatefulWidget {
  const TextFieldDetailScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldDetailScreen> createState() => _TextFieldDetailScreenState();
}

class _TextFieldDetailScreenState extends State<TextFieldDetailScreen> {
  String inputText = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 TextField Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 TextField là widget cho phép người dùng nhập văn bản. Dữ liệu nhập vào có thể được theo dõi và xử lý.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // TextField cơ bản
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nhập tên của bạn',
                hintText: 'Ví dụ: Nguyễn Văn A',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
            ),
            
            const SizedBox(height: 20),
            
            // Hiển thị giá trị nhập vào
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dữ liệu bạn nhập:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    inputText.isEmpty ? '(Chưa có dữ liệu)' : inputText,
                    style: TextStyle(
                      fontSize: 16,
                      color: inputText.isEmpty ? Colors.grey : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // TextField với validation
            const Text('✅ TextField với validation:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'example@email.com',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nTextField(\n  decoration: InputDecoration(...),\n  onChanged: (value) { ... }\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// PASSWORD FIELD DETAIL SCREEN
class PasswordFieldDetailScreen extends StatefulWidget {
  const PasswordFieldDetailScreen({Key? key}) : super(key: key);

  @override
  State<PasswordFieldDetailScreen> createState() => _PasswordFieldDetailScreenState();
}

class _PasswordFieldDetailScreenState extends State<PasswordFieldDetailScreen> {
  bool _obscureText = true;
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PasswordField Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 PasswordField Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 PasswordField là TextField với thuộc tính obscureText = true để ẩn nội dung khi nhập mật khẩu.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Password field với toggle show/hide
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            
            const SizedBox(height: 20),
            
            // Hiển thị độ dài mật khẩu
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Độ dài mật khẩu:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${password.length} ký tự',
                    style: const TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    password.length >= 8 ? '✅ Mật khẩu đủ mạnh' : '⚠️ Mật khẩu cần ít nhất 8 ký tự',
                    style: TextStyle(
                      color: password.length >= 8 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nTextField(\n  obscureText: true,\n  decoration: InputDecoration(...)\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// BUTTON DETAIL SCREEN
class ButtonDetailScreen extends StatelessWidget {
  const ButtonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ElevatedButton Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 ElevatedButton Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 ElevatedButton là nút bấm có hiệu ứng nổi (elevation), phù hợp cho các hành động quan trọng.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Button mặc định
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bạn đã bấm nút!')),
                  );
                },
                child: const Text('Bấm vào đây'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Button với icon
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text('Gửi'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Button tùy chỉnh màu
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Nút tùy chỉnh'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Button disabled
            Center(
              child: ElevatedButton(
                onPressed: null, // null = disabled
                child: const Text('Nút bị vô hiệu hóa'),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nElevatedButton(\n  onPressed: () { ... },\n  child: Text("Label")\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ROW DETAIL SCREEN
class RowDetailScreen extends StatelessWidget {
  const RowDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Layout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Row Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Row sắp xếp các widget con theo chiều ngang (horizontal). Thích hợp cho việc bố trí các phần tử cạnh nhau.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Row với 3 box
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 80, height: 80, color: Colors.blue[300]),
                Container(width: 80, height: 80, color: Colors.blue[600]),
                Container(width: 80, height: 80, color: Colors.blue[900]),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Row với text và icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.person, size: 40, color: Colors.blue),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nguyễn Văn A', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Sinh viên CNTT', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nRow(\n  children: [Widget1(), Widget2(), ...]\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// COLUMN DETAIL SCREEN
class ColumnDetailScreen extends StatelessWidget {
  const ColumnDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Layout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Column Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Column sắp xếp các widget con theo chiều dọc (vertical). Thích hợp để xếp chồng các phần tử lên nhau.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Column với 3 box
            Center(
              child: Column(
                children: [
                  Container(width: 200, height: 60, color: Colors.purple[300], alignment: Alignment.center, child: const Text('Box 1', style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 10),
                  Container(width: 200, height: 60, color: Colors.purple[600], alignment: Alignment.center, child: const Text('Box 2', style: TextStyle(color: Colors.white))),
                  const SizedBox(height: 10),
                  Container(width: 200, height: 60, color: Colors.purple[900], alignment: Alignment.center, child: const Text('Box 3', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nColumn(\n  children: [Widget1(), Widget2(), ...]\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ICON DETAIL SCREEN
class IconDetailScreen extends StatelessWidget {
  const IconDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Icon Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Icon widget hiển thị các biểu tượng từ Material Icons. Flutter cung cấp hàng nghìn icon sẵn có.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                Icon(Icons.home, size: 50, color: Colors.blue),
                Icon(Icons.favorite, size: 50, color: Colors.red),
                Icon(Icons.star, size: 50, color: Colors.orange),
                Icon(Icons.settings, size: 50, color: Colors.grey),
                Icon(Icons.person, size: 50, color: Colors.green),
                Icon(Icons.notifications, size: 50, color: Colors.purple),
              ],
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nIcon(Icons.home, size: 30, color: Colors.blue)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// CHECKBOX DETAIL SCREEN
class CheckboxDetailScreen extends StatefulWidget {
  const CheckboxDetailScreen({Key? key}) : super(key: key);

  @override
  State<CheckboxDetailScreen> createState() => _CheckboxDetailScreenState();
}

class _CheckboxDetailScreenState extends State<CheckboxDetailScreen> {
  bool value1 = false;
  bool value2 = true;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Checkbox Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Checkbox cho phép người dùng chọn nhiều tùy chọn cùng lúc. Giá trị là true/false.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            CheckboxListTile(
              title: const Text('Tôi thích lập trình Flutter'),
              value: value1,
              onChanged: (newValue) {
                setState(() {
                  value1 = newValue!;
                });
              },
            ),
            
            CheckboxListTile(
              title: const Text('Tôi thích học UI Components'),
              value: value2,
              onChanged: (newValue) {
                setState(() {
                  value2 = newValue!;
                });
              },
            ),
            
            CheckboxListTile(
              title: const Text('Tôi muốn trở thành Flutter Developer'),
              value: value3,
              onChanged: (newValue) {
                setState(() {
                  value3 = newValue!;
                });
              },
            ),
            
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Số lựa chọn đã chọn: ${[value1, value2, value3].where((v) => v).length}/3',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nCheckbox(\n  value: isChecked,\n  onChanged: (bool) { ... }\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// RADIO DETAIL SCREEN
class RadioDetailScreen extends StatefulWidget {
  const RadioDetailScreen({Key? key}) : super(key: key);

  @override
  State<RadioDetailScreen> createState() => _RadioDetailScreenState();
}

class _RadioDetailScreenState extends State<RadioDetailScreen> {
  String selectedOption = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Radio Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Radio button cho phép chọn MỘT tùy chọn duy nhất từ nhiều lựa chọn.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ: Bạn thích học framework nào?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            RadioListTile(
              title: const Text('Flutter'),
              value: 'flutter',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            
            RadioListTile(
              title: const Text('React Native'),
              value: 'react',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            
            RadioListTile(
              title: const Text('Native (Swift/Kotlin)'),
              value: 'native',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Bạn đã chọn: ${selectedOption == 'flutter' ? 'Flutter' : selectedOption == 'react' ? 'React Native' : 'Native'}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nRadio(\n  value: "option1",\n  groupValue: selected,\n  onChanged: (val) { ... }\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// SWITCH DETAIL SCREEN
class SwitchDetailScreen extends StatefulWidget {
  const SwitchDetailScreen({Key? key}) : super(key: key);

  @override
  State<SwitchDetailScreen> createState() => _SwitchDetailScreenState();
}

class _SwitchDetailScreenState extends State<SwitchDetailScreen> {
  bool isDarkMode = false;
  bool isNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Switch Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Switch là công tắc bật/tắt (on/off). Thường dùng cho cài đặt.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            SwitchListTile(
              title: const Text('Chế độ tối (Dark Mode)'),
              subtitle: Text(isDarkMode ? 'Đang bật' : 'Đang tắt'),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            
            SwitchListTile(
              title: const Text('Thông báo'),
              subtitle: Text(isNotification ? 'Nhận thông báo' : 'Tắt thông báo'),
              value: isNotification,
              onChanged: (value) {
                setState(() {
                  isNotification = value;
                });
              },
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nSwitch(\n  value: isOn,\n  onChanged: (bool) { ... }\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// SLIDER DETAIL SCREEN
class SliderDetailScreen extends StatefulWidget {
  const SliderDetailScreen({Key? key}) : super(key: key);

  @override
  State<SliderDetailScreen> createState() => _SliderDetailScreenState();
}

class _SliderDetailScreenState extends State<SliderDetailScreen> {
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Slider Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Slider cho phép chọn giá trị bằng cách kéo thanh trượt.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            const Text('Điều chỉnh âm lượng:', style: TextStyle(fontSize: 16)),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            
            Center(
              child: Text(
                'Âm lượng: ${sliderValue.round()}%',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Visual representation
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: sliderValue / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nSlider(\n  value: currentValue,\n  min: 0,\n  max: 100,\n  onChanged: (val) { ... }\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// TEXT BUTTON DETAIL SCREEN
class TextButtonDetailScreen extends StatelessWidget {
  const TextButtonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextButton Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 TextButton Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 TextButton là nút không có nền, chỉ có chữ. Thường dùng cho hành động phụ.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Hủy'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info),
                label: const Text('Xem thêm'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Xóa'),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nTextButton(\n  onPressed: () { ... },\n  child: Text("Label")\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ICON BUTTON DETAIL SCREEN
class IconButtonDetailScreen extends StatelessWidget {
  const IconButtonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IconButton Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 IconButton Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 IconButton là nút chỉ có icon, không có text. Thường dùng trong AppBar hoặc các vị trí nhỏ gọn.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: Colors.blue,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark),
                  color: Colors.orange,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  color: Colors.grey,
                  iconSize: 40,
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nIconButton(\n  onPressed: () { ... },\n  icon: Icon(Icons.favorite)\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// CARD DETAIL SCREEN
class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Card Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Card là container có bóng đổ và bo góc theo Material Design, dùng để nhóm thông tin.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Tiêu đề Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Đây là nội dung bên trong Card. Card giúp tạo giao diện đẹp và tổ chức thông tin rõ ràng.'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 15),
            
            Card(
              color: Colors.blue[50],
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.person, size: 40, color: Colors.blue),
                title: const Text('Nguyễn Văn A'),
                subtitle: const Text('Flutter Developer'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nCard(\n  child: Padding(...)\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// LISTVIEW DETAIL SCREEN
class ListViewDetailScreen extends StatelessWidget {
  const ListViewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Detail')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📌 ListView Widget',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '📖 ListView là danh sách có thể cuộn, hiển thị nhiều item theo chiều dọc.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('Mô tả cho item ${index + 1}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// GRIDVIEW DETAIL SCREEN
class GridViewDetailScreen extends StatelessWidget {
  const GridViewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Detail')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📌 GridView Widget',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '📖 GridView hiển thị các item trong dạng lưới (grid), có thể cuộn.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// DIALOG DETAIL SCREEN
class DialogDetailScreen extends StatelessWidget {
  const DialogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Dialog Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Dialog là hộp thoại pop-up hiển thị trên màn hình, yêu cầu người dùng thực hiện hành động.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Xác nhận'),
                      content: const Text('Bạn có chắc muốn xóa item này?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Hủy'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Xóa'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Hiển thị Dialog'),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nshowDialog(\n  context: context,\n  builder: (context) => AlertDialog(...)\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// SNACKBAR DETAIL SCREEN
class SnackBarDetailScreen extends StatelessWidget {
  const SnackBarDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 SnackBar Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 SnackBar là thông báo ngắn hiển thị ở dưới màn hình, tự động biến mất sau vài giây.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đây là SnackBar thông báo!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Hiển thị SnackBar'),
              ),
            ),
            
            const SizedBox(height: 15),
            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('SnackBar với Action'),
                      action: SnackBarAction(
                        label: 'HOÀN TÁC',
                        onPressed: () {},
                      ),
                      backgroundColor: Colors.blue,
                    ),
                  );
                },
                child: const Text('SnackBar với Action'),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nScaffoldMessenger.of(context).showSnackBar(\n  SnackBar(content: Text("..."))\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// PROGRESS INDICATOR DETAIL SCREEN
class ProgressIndicatorDetailScreen extends StatefulWidget {
  const ProgressIndicatorDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProgressIndicatorDetailScreen> createState() => _ProgressIndicatorDetailScreenState();
}

class _ProgressIndicatorDetailScreenState extends State<ProgressIndicatorDetailScreen> {
  double progress = 0.0;

  void startProgress() {
    setState(() {
      progress = 0.0;
    });
    
    Future.delayed(const Duration(milliseconds: 100), () {
      if (progress < 1.0 && mounted) {
        setState(() {
          progress += 0.1;
        });
        startProgress();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProgressIndicator Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 ProgressIndicator Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 ProgressIndicator hiển thị tiến trình loading hoặc xử lý.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            const Text('1. CircularProgressIndicator (vòng tròn):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Center(
              child: CircularProgressIndicator(),
            ),
            
            const SizedBox(height: 30),
            
            const Text('2. LinearProgressIndicator (thanh ngang):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const LinearProgressIndicator(),
            
            const SizedBox(height: 30),
            
            const Text('3. Progress với giá trị cụ thể:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 10),
            Center(
              child: Text('${(progress * 100).toInt()}%', style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: startProgress,
                child: const Text('Bắt đầu Loading'),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nCircularProgressIndicator()\nLinearProgressIndicator(value: 0.5)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// CONTAINER DETAIL SCREEN
class ContainerDetailScreen extends StatelessWidget {
  const ContainerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📌 Container Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '📖 Container là widget cơ bản nhất, dùng để tạo box có thể tùy chỉnh kích thước, màu sắc, padding, margin, và decoration.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            const Text('1. Container với màu nền:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('Container', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            
            const SizedBox(height: 20),
            
            const Text('2. Container với decoration:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text('Gradient', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            
            const SizedBox(height: 20),
            
            const Text('3. Container với border:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text('Border', style: TextStyle(fontSize: 18)),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '🧠 Cách sử dụng:\nContainer(\n  width: 100,\n  height: 100,\n  color: Colors.blue,\n  child: ...\n)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
// ============================================
// CÁC MÀN HÌNH CHI TIẾT COMPONENTS




// PADDING DETAIL SCREEN
class PaddingDetailScreen extends StatelessWidget {
  const PaddingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Padding Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Padding Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Padding tạo khoảng trống xung quanh widget con.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Container(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(16),
                  child: const Text('Widget với Padding', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            const Text('Padding khác nhau:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            Container(
              color: Colors.orange[100],
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: Container(
                  color: Colors.orange,
                  padding: const EdgeInsets.all(16),
                  child: const Text('Padding only left & top', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// EXPANDED DETAIL SCREEN
class ExpandedDetailScreen extends StatelessWidget {
  const ExpandedDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Expanded Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Expanded mở rộng widget để lấp đầy không gian còn lại trong Row/Column.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Row(
              children: [
                Container(width: 80, height: 80, color: Colors.red, alignment: Alignment.center, child: const Text('Fixed', style: TextStyle(color: Colors.white))),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(height: 80, color: Colors.blue, alignment: Alignment.center, child: const Text('Expanded', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            const Text('Nhiều Expanded với flex:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(height: 60, color: Colors.green, alignment: Alignment.center, child: const Text('Flex 1', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(height: 60, color: Colors.purple, alignment: Alignment.center, child: const Text('Flex 2', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SIZEDBOX DETAIL SCREEN
class SizedBoxDetailScreen extends StatelessWidget {
  const SizedBoxDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBox Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 SizedBox Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 SizedBox tạo box với kích thước cố định hoặc dùng làm khoảng trống.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            SizedBox(
              width: 200,
              height: 100,
              child: Container(color: Colors.blue, alignment: Alignment.center, child: const Text('200x100 SizedBox', style: TextStyle(color: Colors.white))),
            ),
            
            const Text('Khoảng cách 30px', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 30),
            const Text('↑ Đây là SizedBox làm spacing', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// TABBAR DETAIL SCREEN
class TabBarDetailScreen extends StatelessWidget {
  const TabBarDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Detail'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.home, size: 80, color: Colors.blue), SizedBox(height: 20), Text('Home Tab', style: TextStyle(fontSize: 24))])),
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.search, size: 80, color: Colors.green), SizedBox(height: 20), Text('Search Tab', style: TextStyle(fontSize: 24))])),
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.person, size: 80, color: Colors.orange), SizedBox(height: 20), Text('Profile Tab', style: TextStyle(fontSize: 24))])),
          ],
        ),
      ),
    );
  }
}

// BOTTOM NAVIGATION BAR DETAIL SCREEN
class BottomNavDetailScreen extends StatefulWidget {
  const BottomNavDetailScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavDetailScreen> createState() => _BottomNavDetailScreenState();
}

class _BottomNavDetailScreenState extends State<BottomNavDetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon([Icons.home, Icons.favorite, Icons.settings][_selectedIndex], size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(['Home Page', 'Favorites Page', 'Settings Page'][_selectedIndex], style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// DRAWER DETAIL SCREEN
class DrawerDetailScreen extends StatelessWidget {
  const DrawerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Detail')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 40, color: Colors.blue)),
                  SizedBox(height: 10),
                  Text('Nguyễn Văn A', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('example@email.com', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.home), title: const Text('Trang chủ'), onTap: () {}),
            ListTile(leading: const Icon(Icons.person), title: const Text('Hồ sơ'), onTap: () {}),
            ListTile(leading: const Icon(Icons.settings), title: const Text('Cài đặt'), onTap: () {}),
            const Divider(),
            ListTile(leading: const Icon(Icons.logout), title: const Text('Đăng xuất'), onTap: () {}),
          ],
        ),
      ),
      body: const Center(child: Text('☰ Mở Drawer từ góc trên bên trái', style: TextStyle(fontSize: 18))),
    );
  }
}

// APPBAR DETAIL SCREEN
class AppBarDetailScreen extends StatelessWidget {
  const AppBarDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom AppBar'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        backgroundColor: Colors.purple,
        elevation: 4,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📌 AppBar Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('📖 AppBar là thanh tiêu đề ở đầu màn hình, có thể chứa title, icons, và actions.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('✨ Features:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('• Title (tiêu đề)'),
            Text('• Leading icon (nút quay lại)'),
            Text('• Actions (các nút bên phải)'),
            Text('• Màu nền tùy chỉnh'),
            Text('• Elevation (độ nổi)'),
          ],
        ),
      ),
    );
  }
}

// DROPDOWN DETAIL SCREEN
class DropdownDetailScreen extends StatefulWidget {
  const DropdownDetailScreen({Key? key}) : super(key: key);

  @override
  State<DropdownDetailScreen> createState() => _DropdownDetailScreenState();
}

class _DropdownDetailScreenState extends State<DropdownDetailScreen> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 DropdownButton Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 DropdownButton cho phép chọn một giá trị từ danh sách thả xuống.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            const Text('Chọn thành phố:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCity,
              hint: const Text('-- Chọn thành phố --'),
              isExpanded: true,
              items: ['Hà Nội', 'TP.HCM', 'Đà Nẵng', 'Cần Thơ', 'Hải Phòng'].map((city) {
                return DropdownMenuItem(value: city, child: Text(city));
              }).toList(),
              onChanged: (value) => setState(() => selectedCity = value),
            ),
            
            const SizedBox(height: 20),
            if (selectedCity != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
                child: Text('Bạn đã chọn: $selectedCity', style: const TextStyle(fontSize: 16)),
              ),
          ],
        ),
      ),
    );
  }
}

// DATEPICKER DETAIL SCREEN
class DatePickerDetailScreen extends StatefulWidget {
  const DatePickerDetailScreen({Key? key}) : super(key: key);

  @override
  State<DatePickerDetailScreen> createState() => _DatePickerDetailScreenState();
}

class _DatePickerDetailScreenState extends State<DatePickerDetailScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 DatePicker Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 DatePicker cho phép chọn ngày tháng từ lịch.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
                label: const Text('Chọn ngày'),
              ),
            ),
            
            const SizedBox(height: 20),
            if (selectedDate != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 10),
                    Text('Ngày đã chọn: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// TIMEPICKER DETAIL SCREEN
class TimePickerDetailScreen extends StatefulWidget {
  const TimePickerDetailScreen({Key? key}) : super(key: key);

  @override
  State<TimePickerDetailScreen> createState() => _TimePickerDetailScreenState();
}

class _TimePickerDetailScreenState extends State<TimePickerDetailScreen> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TimePicker Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 TimePicker Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 TimePicker cho phép chọn giờ và phút.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _selectTime(context),
                icon: const Icon(Icons.access_time),
                label: const Text('Chọn giờ'),
              ),
            ),
            
            const SizedBox(height: 20),
            if (selectedTime != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.orange),
                    const SizedBox(width: 10),
                    Text('Giờ đã chọn: ${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// FORM DETAIL SCREEN
class FormDetailScreen extends StatefulWidget {
  const FormDetailScreen({Key? key}) : super(key: key);

  @override
  State<FormDetailScreen> createState() => _FormDetailScreenState();
}

class _FormDetailScreenState extends State<FormDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('📌 Form Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('📖 Form quản lý và validate nhiều input fields.', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              
              TextFormField(
                decoration: const InputDecoration(labelText: 'Họ tên', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                validator: (value) => value == null || value.isEmpty ? 'Vui lòng nhập họ tên' : null,
                onSaved: (value) => name = value,
              ),
              
              const SizedBox(height: 15),
              
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Vui lòng nhập email';
                  if (!value.contains('@')) return 'Email không hợp lệ';
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              
              const SizedBox(height: 20),
              
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đăng ký thành công: $name - $email')),
                      );
                    }
                  },
                  child: const Text('Đăng ký'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PAGEVIEW DETAIL SCREEN
class PageViewDetailScreen extends StatelessWidget {
  const PageViewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView Detail')),
      body: PageView(
        children: [
          Container(color: Colors.red[300], alignment: Alignment.center, child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.looks_one, size: 80, color: Colors.white), Text('Page 1', style: TextStyle(fontSize: 32, color: Colors.white))])),
          Container(color: Colors.green[300], alignment: Alignment.center, child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.looks_two, size: 80, color: Colors.white), Text('Page 2', style: TextStyle(fontSize: 32, color: Colors.white))])),
          Container(color: Colors.blue[300], alignment: Alignment.center, child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.looks_3, size: 80, color: Colors.white), Text('Page 3', style: TextStyle(fontSize: 32, color: Colors.white)), SizedBox(height: 20), Text('← Vuốt để chuyển trang →', style: TextStyle(fontSize: 16, color: Colors.white70))])),
        ],
      ),
    );
  }
}

// REFRESH INDICATOR DETAIL SCREEN
class RefreshIndicatorDetailScreen extends StatefulWidget {
  const RefreshIndicatorDetailScreen({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorDetailScreen> createState() => _RefreshIndicatorDetailScreenState();
}

class _RefreshIndicatorDetailScreenState extends State<RefreshIndicatorDetailScreen> {
  List<int> items = List.generate(10, (index) => index);

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      items = List.generate(10, (index) => index + items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RefreshIndicator Detail')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.arrow_downward, size: 40, color: Colors.blue),
                    SizedBox(height: 10),
                    Text('Kéo xuống để làm mới', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              );
            }
            return ListTile(
              leading: CircleAvatar(child: Text('${items[index - 1]}')),
              title: Text('Item ${items[index - 1]}'),
            );
          },
        ),
      ),
    );
  }
}

// SINGLECHILDSCROLLVIEW DETAIL SCREEN
class SingleChildScrollViewDetailScreen extends StatelessWidget {
  const SingleChildScrollViewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingleChildScrollView Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('📌 SingleChildScrollView', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Làm cho nội dung có thể cuộn khi vượt quá màn hình.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ...List.generate(20, (index) => Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('Scrollable Item ${index + 1}'),
                subtitle: const Text('Cuộn xuống để xem thêm'),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// CIRCLEAVATAR DETAIL SCREEN
class CircleAvatarDetailScreen extends StatelessWidget {
  const CircleAvatarDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CircleAvatar Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 CircleAvatar Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 CircleAvatar tạo hình tròn chứa ảnh hoặc icon, thường dùng cho avatar.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Ví dụ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(radius: 40, backgroundColor: Colors.blue, child: Icon(Icons.person, size: 40, color: Colors.white)),
                CircleAvatar(radius: 40, backgroundColor: Colors.red, child: Text('AB', style: TextStyle(fontSize: 24, color: Colors.white))),
                CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://picsum.photos/200')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ANIMATED CONTAINER DETAIL SCREEN
class AnimatedContainerDetailScreen extends StatefulWidget {
  const AnimatedContainerDetailScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerDetailScreen> createState() => _AnimatedContainerDetailScreenState();
}

class _AnimatedContainerDetailScreenState extends State<AnimatedContainerDetailScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('📌 AnimatedContainer', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Container với animation tự động khi thay đổi properties.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: _expanded ? 300 : 100,
                height: _expanded ? 300 : 100,
                decoration: BoxDecoration(
                  color: _expanded ? Colors.blue : Colors.red,
                  borderRadius: BorderRadius.circular(_expanded ? 50 : 10),
                ),
                alignment: Alignment.center,
                child: Text(_expanded ? 'Tap to shrink' : 'Tap to expand', style: const TextStyle(color: Colors.white)),
              ),
            ),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: const Text('Toggle Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

// OPACITY DETAIL SCREEN
class OpacityDetailScreen extends StatefulWidget {
  const OpacityDetailScreen({Key? key}) : super(key: key);

  @override
  State<OpacityDetailScreen> createState() => _OpacityDetailScreenState();
}

class _OpacityDetailScreenState extends State<OpacityDetailScreen> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opacity Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Opacity Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Opacity điều chỉnh độ trong suốt của widget (0.0 = trong suốt, 1.0 = đục).', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Center(
              child: Opacity(
                opacity: _opacity,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Opacity Demo', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            Text('Độ trong suốt: ${(_opacity * 100).toInt()}%', style: const TextStyle(fontSize: 16)),
            Slider(
              value: _opacity,
              min: 0.0,
              max: 1.0,
              onChanged: (value) => setState(() => _opacity = value),
            ),
          ],
        ),
      ),
    );
  }
}

// CHIP DETAIL SCREEN
class ChipDetailScreen extends StatelessWidget {
  const ChipDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Chip Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Chip là phần tử nhỏ gọn hiển thị thông tin, có thể có icon và nút xóa.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(label: Text('Flutter'), avatar: Icon(Icons.code, size: 20)),
                Chip(label: Text('Dart'), backgroundColor: Colors.blue),
                Chip(label: Text('Mobile'), avatar: CircleAvatar(child: Text('M'))),
                Chip(label: Text('UI/UX'), deleteIcon: Icon(Icons.close)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// BADGE DETAIL SCREEN
class BadgeDetailScreen extends StatelessWidget {
  const BadgeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Badge Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Badge hiển thị số lượng thông báo hoặc trạng thái trên icon.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Badge(
                  label: const Text('3'),
                  child: IconButton(icon: const Icon(Icons.notifications, size: 40), onPressed: () {}),
                ),
                Badge(
                  label: const Text('99+'),
                  backgroundColor: Colors.red,
                  child: IconButton(icon: const Icon(Icons.email, size: 40), onPressed: () {}),
                ),
                Badge(
                  label: const Text('5'),
                  backgroundColor: Colors.green,
                  child: IconButton(icon: const Icon(Icons.shopping_cart, size: 40), onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TOOLTIP DETAIL SCREEN
class TooltipDetailScreen extends StatelessWidget {
  const TooltipDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tooltip Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Tooltip Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Tooltip hiển thị gợi ý khi người dùng long-press vào widget.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text('🧩 Long-press các icon để xem tooltip:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: 'Trang chủ',
                  child: IconButton(icon: const Icon(Icons.home, size: 40), onPressed: () {}),
                ),
                Tooltip(
                  message: 'Tìm kiếm',
                  child: IconButton(icon: const Icon(Icons.search, size: 40), onPressed: () {}),
                ),
                Tooltip(
                  message: 'Cài đặt',
                  child: IconButton(icon: const Icon(Icons.settings, size: 40), onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// DIVIDER DETAIL SCREEN
class DividerDetailScreen extends StatelessWidget {
  const DividerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divider Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Divider Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Divider tạo đường kẻ ngang phân cách nội dung.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            
            const Text('Mục 1'),
            const Divider(),
            const Text('Mục 2'),
            const Divider(thickness: 2, color: Colors.blue),
            const Text('Mục 3'),
            const Divider(thickness: 3, color: Colors.red, indent: 20, endIndent: 20),
            const Text('Mục 4'),
          ],
        ),
      ),
    );
  }
}

// TABLE DETAIL SCREEN
class TableDetailScreen extends StatelessWidget {
  const TableDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Table Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Table hiển thị dữ liệu dạng bảng với hàng và cột.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Colors.blue),
                  children: [
                    Padding(padding: EdgeInsets.all(8), child: Text('Tên', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Tuổi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Lớp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Nguyễn Văn A')),
                  Padding(padding: EdgeInsets.all(8), child: Text('20')),
                  Padding(padding: EdgeInsets.all(8), child: Text('CNTT')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Trần Thị B')),
                  Padding(padding: EdgeInsets.all(8), child: Text('21')),
                  Padding(padding: EdgeInsets.all(8), child: Text('KTPM')),
                ]),
                TableRow(children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Lê Văn C')),
                  Padding(padding: EdgeInsets.all(8), child: Text('19')),
                  Padding(padding: EdgeInsets.all(8), child: Text('MMT')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// WRAP DETAIL SCREEN
class WrapDetailScreen extends StatelessWidget {
  const WrapDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 Wrap Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 Wrap tự động xuống dòng khi các phần tử không vừa trên một hàng.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(15, (index) => Chip(
                label: Text('Tag ${index + 1}'),
                backgroundColor: Colors.primaries[index % Colors.primaries.length].withOpacity(0.3),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// GESTUREDETECTOR DETAIL SCREEN
class GestureDetectorDetailScreen extends StatefulWidget {
  const GestureDetectorDetailScreen({Key? key}) : super(key: key);

  @override
  State<GestureDetectorDetailScreen> createState() => _GestureDetectorDetailScreenState();
}

class _GestureDetectorDetailScreenState extends State<GestureDetectorDetailScreen> {
  String action = 'Chạm vào box để tương tác';
  int tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('📌 GestureDetector', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 GestureDetector phát hiện các cử chỉ chạm như tap, double tap, long press, swipe...', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            Center(
              child: GestureDetector(
                onTap: () => setState(() {
                  action = 'Tap';
                  tapCount++;
                }),
                onDoubleTap: () => setState(() => action = 'Double Tap'),
                onLongPress: () => setState(() => action = 'Long Press'),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 5))],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.touch_app, size: 60, color: Colors.white),
                      const SizedBox(height: 20),
                      Text(action, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('Taps: $tapCount', style: const TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// INKWELL DETAIL SCREEN
class InkWellDetailScreen extends StatelessWidget {
  const InkWellDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InkWell Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('📌 InkWell Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('📖 InkWell tạo hiệu ứng ripple (gợn sóng) khi chạm, theo Material Design.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('InkWell tapped!'))),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.touch_app, color: Colors.blue, size: 40),
                    SizedBox(width: 20),
                    Expanded(child: Text('Tap để xem ripple effect', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            InkWell(
              onTap: () {},
              splashColor: Colors.red.withOpacity(0.3),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.favorite, color: Colors.red, size: 40),
                    SizedBox(width: 20),
                    Expanded(child: Text('Custom splash color', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DISMISSIBLE DETAIL SCREEN
class DismissibleDetailScreen extends StatefulWidget {
  const DismissibleDetailScreen({Key? key}) : super(key: key);

  @override
  State<DismissibleDetailScreen> createState() => _DismissibleDetailScreenState();
}

class _DismissibleDetailScreenState extends State<DismissibleDetailScreen> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dismissible Detail')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('📌 Dismissible Widget', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('📖 Dismissible cho phép vuốt để xóa item khỏi danh sách.', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('← Vuốt sang trái hoặc phải để xóa →', style: TextStyle(fontSize: 14, color: Colors.blue)),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(items[index]),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.delete, color: Colors.white, size: 30),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white, size: 30),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${items.length > index ? items[index] : "Item"} đã bị xóa')),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(items[index]),
                      subtitle: const Text('Vuốt để xóa'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}