import 'package:flutter/material.dart';
import 'package:nckh_app/widgets/base_screen.dart';

class ChatbotScreen extends StatelessWidget {
@override
Widget build(BuildContext context){
  return BaseScreen(
    title:"Hỏi Đáp",
    body: Center(
      child: Text("Chatbot"),
      )
  );
}
}