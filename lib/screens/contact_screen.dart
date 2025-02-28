import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';


class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Liên hệ",
      body: Center(
        child: Text("Thông tin liên hệ"),
      ), actions: [],
    );
  }
}
