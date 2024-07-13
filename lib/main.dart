import 'package:attendix/firebase_options.dart';
import 'package:attendix/forgot.dart';
import 'package:attendix/getstarted.dart';
import 'package:attendix/login.dart';
import 'package:attendix/role.dart';
import 'package:attendix/signup.dart';
import 'package:attendix/studentlogin.dart';
import 'package:attendix/teacherlogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: GetStartedPage());
  }
}
