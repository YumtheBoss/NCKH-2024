import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Hướng dẫn đăng ký",
      body: Center(
        child: Text("Hướng dẫn đăng ký xét tuyển"),
      ), actions: [],
    );
  }
}
