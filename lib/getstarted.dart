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
              height: 25,
              width: 145,
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Image.asset(
            'assets/Group 58.png',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            'Streamline your \n  Attendance process \n with Attendix',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3370B6),
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 288,
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
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
