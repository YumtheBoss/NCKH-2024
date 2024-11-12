import 'package:flutter/material.dart';

// Hàm main() để khởi chạy ứng dụng
void main() {
  runApp(MyApp());
}

// Widget MyApp đại diện cho ứng dụng chính
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trả về MaterialApp với màn hình chính là HomeScreen
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false, // Tắt banner "Debug" ở góc màn hình
    );
  }
}

// Widget HomeScreen là màn hình chính của ứng dụng
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Thiết lập màu nền là màu trắng
      appBar: AppBar(
        backgroundColor: Color(0xFF004BA0), // Màu xanh đậm cho AppBar
        leading: Icon(Icons.menu, color: Colors.white), // Icon menu ở góc trái của AppBar
        actions: [
          // Icon thông báo ở góc phải của AppBar
          Padding(
            padding: EdgeInsets.only(right: 20.0), // Khoảng cách bên phải của icon thông báo
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Khoảng trống phía trên logo

          // Phần hiển thị logo
          Center(
            child: CircleAvatar(
              radius: 60, // Bán kính của hình tròn logo
              backgroundColor: Colors.white, // Màu nền của logo là trắng
              child: Icon(
                Icons.account_tree, // Icon đại diện cho logo
                size: 100, // Kích thước của icon
                color: Color(0xFF004BA0), // Màu xanh đậm cho icon
              ),
            ),
          ),
          SizedBox(height: 20), // Khoảng trống giữa logo và các nút chính

          // Hàng chứa các nút chính
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn đều các nút chính trong hàng
            children: [
              // Nút "Đăng ký xét tuyển"
              FeatureButton(
                icon: Icons.app_registration, // Icon đại diện cho chức năng
                label: 'Đăng ký xét tuyển', // Nhãn của nút
                color: Colors.yellow[100]!, // Màu nền của nút
              ),
              // Nút "Tra cứu kết quả"
              FeatureButton(
                icon: Icons.search,
                label: 'Tra cứu kết quả',
                color: Colors.yellow[100]!,
              ),
            ],
          ),
          SizedBox(height: 30), // Khoảng trống giữa các nút chính và tiêu đề "Chức năng khác"

          // Tiêu đề "Chức năng khác"
          Text(
            'Chức năng khác',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Thiết lập kiểu chữ cho tiêu đề
          ),
          SizedBox(height: 20), // Khoảng trống giữa tiêu đề và các nút phụ

          // Nhóm các nút phụ được hiển thị theo dạng lưới
          Wrap(
            spacing: 20, // Khoảng cách ngang giữa các nút
            runSpacing: 20, // Khoảng cách dọc giữa các nút
            children: [
              // Nút "Hồ sơ của tôi"
              FeatureButton(
                icon: Icons.person,
                label: 'Hồ sơ của tôi',
                color: Colors.blue[700]!, // Màu nền xanh đậm cho nút
              ),
              // Nút "Hướng dẫn đăng ký"
              FeatureButton(
                icon: Icons.book,
                label: 'Hướng dẫn đăng ký',
                color: Colors.blue[400]!, // Màu nền xanh nhạt cho nút
              ),
              // Nút "Tin tức"
              FeatureButton(
                icon: Icons.article,
                label: 'Tin tức',
                color: Colors.redAccent, // Màu nền đỏ cho nút
              ),
              // Nút "Liên hệ"
              FeatureButton(
                icon: Icons.phone,
                label: 'Liên hệ',
                color: Colors.orangeAccent, // Màu nền cam cho nút
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget tùy chỉnh cho các nút chức năng
class FeatureButton extends StatelessWidget {
  final IconData icon; // Icon của nút
  final String label; // Nhãn của nút
  final Color color; // Màu nền của nút

  // Constructor nhận vào các thuộc tính icon, label và color
  FeatureButton({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Chiều rộng của nút
      height: 100, // Chiều cao của nút
      decoration: BoxDecoration(
        color: color, // Thiết lập màu nền của nút
        borderRadius: BorderRadius.circular(8), // Bo tròn các góc của nút
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Canh giữa nội dung theo chiều dọc
        children: [
          Icon(icon, color: Colors.white, size: 30), // Hiển thị icon của nút
          SizedBox(height: 10), // Khoảng trống giữa icon và nhãn
          Text(
            label, // Hiển thị nhãn của nút
            style: TextStyle(color: Colors.white, fontSize: 14), // Thiết lập kiểu chữ cho nhãn
            textAlign: TextAlign.center, // Căn giữa nhãn theo chiều ngang
          ),
        ],
      ),
    );
  }
}
