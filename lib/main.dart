import 'package:attendix/forgot.dart';
import 'package:attendix/getstarted.dart';
import 'package:attendix/login.dart';
import 'package:attendix/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          useMaterial3: true,
        ),
        home: SignUpPage());
  }
}
