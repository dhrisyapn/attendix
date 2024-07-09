import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 30,
                // width: 150,
              ),
            ),
            Image.asset('assets/login.png'),
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
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
            //sized box 5
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
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
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Create account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
