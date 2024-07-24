import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SudentProfilePage extends StatefulWidget {
  const SudentProfilePage({super.key});

  @override
  State<SudentProfilePage> createState() => _SudentProfilePageState();
}

class _SudentProfilePageState extends State<SudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              'assets/Group 16.png',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
