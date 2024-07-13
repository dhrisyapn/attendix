import 'package:attendix/forgot.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  var eyeicon = const Icon(Icons.visibility_off);
  void toggleicon() {
    setState(() {
      visible = !visible;
      if (!visible) {
        eyeicon = const Icon(Icons.visibility);
      } else {
        eyeicon = const Icon(Icons.visibility_off);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 30,
                  // width: 150,
                ),
              ),
              Image.asset('assets/login.png'),
              Text(
                'Login as Admin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF042C38),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
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
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: toggleicon,
                      icon: eyeicon,
                      color: Color(0xFF2c86c8),
                    ),
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
                  obscureText: visible,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPage()));
                      },
                      child: Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
