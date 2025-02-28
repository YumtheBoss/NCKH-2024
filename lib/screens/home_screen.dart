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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
        leading: Builder(
  builder: (context) => IconButton(
    icon: const Icon(Icons.menu),
    onPressed: () {
      Scaffold.of(context).openDrawer();
    },
  ),
),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle, size: 28),
            onSelected: (value) {
              if (value == 'login') {
                Navigator.pushNamed(context, '/login');
              } else if (value == 'register') {
                Navigator.pushNamed(context, '/register');
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'login',
                child: Text('Đăng nhập'),
              ),
              const PopupMenuItem<String>(
                value: 'register',
                child: Text('Đăng ký'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Danh mục',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            _buildDrawerItem(Icons.home, 'Trang chủ', () {
              Navigator.pop(context);
            }),
            _buildDrawerItem(Icons.assignment, 'Đăng ký xét tuyển', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
            }),
            _buildDrawerItem(Icons.search, 'Tra cứu kết quả', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultLookupScreen()));
            }),
            _buildDrawerItem(Icons.person, 'Hồ sơ của tôi', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }),
            _buildDrawerItem(Icons.book, 'Hướng dẫn đăng ký', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GuideScreen()));
            }),
            _buildDrawerItem(Icons.article, 'Tin tức', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
            }),
            _buildDrawerItem(Icons.phone, 'Liên hệ', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
            }),
            _buildDrawerItem(Icons.chat_bubble_outline, 'Hỏi Đáp', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotScreen()));
            }),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
  padding: const EdgeInsets.all(20),
  color: Colors.white,
  child: Center(
    child: Image.asset(
      'Assets/Logo.png',
      width: 160, // tuỳ theo kích thước logo
      height: 160,
      fit: BoxFit.contain,
    ),
  ),
),

          const SizedBox(height: 20),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FeatureButton(
                    title: "Tra cứu kết quả",
                    icon: Icons.search,
                    color: Colors.amber.shade300,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultLookupScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                  ),
                  FeatureButton(
                    title: "Hướng dẫn đăng ký",
                    icon: Icons.book,
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuideScreen()));
                    },
                  ),
                  FeatureButton(
                    title: "Tin tức",
                    icon: Icons.article,
                    color: Colors.pink,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
                    },
                  ),
                  FeatureButton(
                    title: "Liên hệ",
                    icon: Icons.phone,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
                    },
                  ),
                  FeatureButton(
                    title: "Hỏi Đáp",
                    icon: Icons.chat_bubble_outline,
                    color: Colors.yellow,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotScreen()));
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

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
