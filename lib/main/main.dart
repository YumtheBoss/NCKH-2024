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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/home', // HomeScreen là màn hình đầu tiên
      routes: {
        '/home': (context) =>  HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
