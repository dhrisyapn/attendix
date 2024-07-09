import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              height: 30,
              width: 150,
            ),
          ),
          Image.asset(
            'assets/Group 59.png',
            width: double.infinity,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          Text(
            'Lost your password?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  'Enter email to get reset link',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: Color(0xFF7A7F86),
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF2c86c8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF2c86c8)),
                ),
              ),
              style: TextStyle(
                color: Color(0xFF7A7F86),
                fontSize: 17,
              ),
              cursorColor: Colors.blue,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: ShapeDecoration(
                color: Color(0xFF2C86C8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
