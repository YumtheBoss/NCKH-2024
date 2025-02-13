import 'package:flutter/material.dart';
import 'package:nckh_app/screens/home_screen.dart';
import 'package:nckh_app/AuthenScreen/LoginScreen.dart';
import 'package:nckh_app/AuthenScreen/RegisterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Xét tuyển',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),  
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),  
      },
    );
  }
}
