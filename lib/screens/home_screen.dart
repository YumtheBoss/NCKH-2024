import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';
import 'package:nckh_app/screens/profile_screen.dart';
import 'package:nckh_app/screens/registration_screen.dart';
import 'package:nckh_app/screens/result_lookup_screen.dart';
import 'package:nckh_app/screens/guide_screen.dart';
import 'package:nckh_app/screens/news_screen.dart';
import 'package:nckh_app/screens/contact_screen.dart';
import 'package:nckh_app/screens/chatbot_screens.dart';
import 'package:nckh_app/widgets/feature_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Trang chủ",
      body: Column(
        children: [
          // Phần đầu trang: logo hoặc hình ảnh trung tâm
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.device_hub,
                  size: 100,
                  color: Colors.blueAccent,
                ), // Thay bằng logo thực tế nếu có
              ),
            ),
          ),

          // Khoảng cách giữa logo và các nút
          SizedBox(height: 20),

          // Dòng 1: Đăng ký xét tuyển và Tra cứu kết quả
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FeatureButton(
                    title: "Đăng ký xét tuyển",
                    icon: Icons.assignment,
                    color: Colors.amber.shade600,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationScreen()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: FeatureButton(
                    title: "Tra cứu kết quả",
                    icon: Icons.search,
                    color: Colors.amber.shade300,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultLookupScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Dòng 2: Chức năng khác
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  FeatureButton(
                    title: "Hồ sơ của tôi",
                    icon: Icons.person,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                  FeatureButton(
                    title: "Hướng dẫn đăng ký",
                    icon: Icons.book,
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GuideScreen()),
                      );
                    },
                  ),
                  FeatureButton(
                    title: "Tin tức",
                    icon: Icons.article,
                    color: Colors.pink,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsScreen()),
                      );
                    },
                  ),
                  FeatureButton(
                    title: "Liên hệ",
                    icon: Icons.phone,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactScreen()),
                      );
                    },
                  ),
                  FeatureButton(
                    title: "Hỏi Đáp",
                    icon: Icons.chat_bubble_outline,
                    color: Colors.yellow,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatbotScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
