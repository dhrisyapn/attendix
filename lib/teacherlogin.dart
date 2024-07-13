import 'package:attendix/forgot.dart';
import 'package:attendix/teacherhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherLoginPage extends StatefulWidget {
  const TeacherLoginPage({super.key});

  @override
  State<TeacherLoginPage> createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {
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

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in function
  Future<void> signInWithEmailPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      // Check if sign in was successful
      if (userCredential.user != null) {
        // Navigate to your target page if login is successful
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TeacherHomePage()));
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
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
                'Login as Teacher',
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
                  controller: emailcontroller,
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
                  controller: passwordcontroller,
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
                child: GestureDetector(
                  onTap: () {
                    signInWithEmailPassword();
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
