import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';

class ResultLookupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Tra cứu kết quả",
      body: Center(
        child: Text("Form tra cứu kết quả xét tuyển"),
      ), actions: [],
    );
  }
}
