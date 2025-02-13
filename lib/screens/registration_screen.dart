import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Đăng ký xét tuyển",
      body: Center(
        child: Text("Form đăng ký xét tuyển"),
      ),
    );
  }
}
