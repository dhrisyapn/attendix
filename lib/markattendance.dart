import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MarkAttendancePage extends StatefulWidget {
  String docid;
  String classname;
  MarkAttendancePage({super.key, required this.docid, required this.classname});

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  bool isChecked = true;
  List ispresent = [];
  Widget attendance(String name, String rollno, int index) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rollno,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Checkbox(
            value: ispresent[index][1],
            onChanged: (bool? value) {
              // Toggle the state
              setState(() {
                ispresent[index][1] = value!;
              });
            },
            activeColor: Color.fromARGB(
                255, 9, 112, 12), // Change the checkbox color to blue
          ),
        ],
      ),
    );
  }

  void markAttendance() {
    for (int i = 0; i < ispresent.length; i++) {
      FirebaseFirestore.instance
          .collection('students')
          .doc(widget.classname)
          .collection('studentdata')
          .doc(ispresent[i][2])
          .collection('attendance')
          .doc(
            //today's date as dd-mm-yyyy
            DateTime.now().day.toString() +
                '-' +
                DateTime.now().month.toString() +
                '-' +
                DateTime.now().year.toString(),
          )
          .collection('data')
          .doc(ispresent[i][0])
          .set({'ispresent': ispresent[i][1]});
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mark Attendance',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 616,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFF2C86C8)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Roll no',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            'Name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Attendance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // attendance(),
                      // attendance(),
                      // attendance(),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('students')
                              .doc(widget.classname)
                              .collection('studentdata')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            if (!snapshot.hasData) {
                              return Text('Loading...');
                            }
                            final documents = snapshot.data!.docs;
                            return ListView.builder(
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                final doc = documents[index];
                                List data = [
                                  doc['rollno'],
                                  true,
                                  doc.id,
                                  widget.docid
                                ];
                                ispresent.add(data);
                                return attendance(
                                    doc['name'], doc['rollno'], index);
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            markAttendance();
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
                                'Submit',
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
            ),
          ],
        ),
      ),
    );
  }
}
