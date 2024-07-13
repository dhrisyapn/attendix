import 'package:attendix/role.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
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
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/Group 58.png',
            width: double.infinity,
          ),
          SizedBox(height: 30),
          Text(
            'Streamline your \n  Attendance process \n with Attendix',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3370B6),
              fontSize: 27,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectRolePage()));
              },
              child: Container(
                width: double.infinity,
                height: 43,
                decoration: ShapeDecoration(
                  color: Color(0xFF2C86C8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
    );
  }
}
