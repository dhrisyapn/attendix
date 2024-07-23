import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class subjectReportPage extends StatefulWidget {
  const subjectReportPage({super.key});

  @override
  State<subjectReportPage> createState() => _subjectReportPageState();
}

class _subjectReportPageState extends State<subjectReportPage> {
  final email = FirebaseAuth.instance.currentUser!.email;
  Widget report(String subject, String percentage) {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            percentage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  late Future<List<DocumentSnapshot>> futureAttendanceRecords;

  Future<List<DocumentSnapshot>> _fetchAttendance() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('userdata')
        .doc(email) // Use the email to identify the document
        .collection('attendance')
        .get();

    return querySnapshot.docs;
  }

  @override
  void initState() {
    super.initState();
    futureAttendanceRecords = _fetchAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<DocumentSnapshot>>(
            future: futureAttendanceRecords,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var document =
                        snapshot.data![index].data() as Map<String, dynamic>;
                    // Assuming each document contains a 'date' field
                    return ListTile(
                      title: Text(document['date'] ?? 'No Date'),
                    );
                  },
                );
              } else {
                return Center(child: Text('No attendance records found'));
              }
            },
          ),
        ],
      ),
    );
  }
}
