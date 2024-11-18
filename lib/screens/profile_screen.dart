import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Hồ sơ của tôi",
      body: Center(
        child: Text("Thông tin hồ sơ người dùng"),
      ),
    );
  }
}
