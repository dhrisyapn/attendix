import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Add Student',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
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
              height: 8,
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
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Class',
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
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Roll no',
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
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone no.',
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
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Register no.',
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
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Admission no.',
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
              height: MediaQuery.of(context).size.height * 0.2,
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
                    'ADD',
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
    );
  }
}
