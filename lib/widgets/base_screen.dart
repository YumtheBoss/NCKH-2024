import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseScreen({required this.title, required this.body, Key? key, required List<PopupMenuButton<String>> actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: body,
    );
  }
}
