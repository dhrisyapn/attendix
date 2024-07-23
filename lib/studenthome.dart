import 'package:attendix/subjectreport.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  Future<Widget> timetable(
      String subject, String start, String end, String docid) async {
    String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    // Access Firestore, navigate to the specific document
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('userdata')
        .doc(email) // Use the user's email to identify the document
        .collection('attendance')
        .doc(todayDate)
        .collection('subjects')
        .doc(subject)
        .get();

    // Check if the document exists and has the 'ispresent' field
    String isPresent = 'no';
    if (documentSnapshot.exists) {
      isPresent = documentSnapshot.get('ispresent').toString();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50, color: Color(0xFF2C86C8)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$start-$end',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      documentSnapshot.exists
                          ? documentSnapshot.get('ispresent').toString() ==
                                  'true'
                              ? 'present'
                              : 'absent'
                          : "....",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1C591B),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // get current user email
  final email = FirebaseAuth.instance.currentUser!.email;
  Future<List<DocumentSnapshot>>? timetableDocuments;

  @override
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Welcome Student,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Today’s timetable',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('classes')
                .doc('10A')
                .collection('timetable')
                .doc('Monday')
                .collection('Subjects')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                // Create a list of timetable widgets from the snapshot documents
                List<Future<Widget>> timetableWidgets =
                    snapshot.data!.docs.map((doc) {
                  return timetable(
                      doc['subject'],
                      DateFormat('HH:mm').format(doc['start']
                          .toDate()), // Assuming 'start' is a Timestamp
                      DateFormat('HH:mm').format(
                        doc['end'].toDate(),
                      ),
                      doc.id);
                }).toList();

                // Display the timetable widgets inside a Column
                return SingleChildScrollView(
                    child: FutureBuilder<List<Widget>>(
                  future: Future.wait(
                      timetableWidgets), // Wait for all futures in the list to complete
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show loading indicator while waiting
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error if any
                    } else {
                      // Once futures are resolved, return a widget that uses the list of Widgets
                      return Column(
                        children:
                            snapshot.data!, // Use the resolved list of Widgets
                      );
                    }
                  },
                ));
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => subjectReportPage(),
                  ),
                );
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
                    'View Subject Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
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
