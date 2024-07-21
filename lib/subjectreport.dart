import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class aubjectReportPage extends StatefulWidget {
  const aubjectReportPage({super.key});

  @override
  State<aubjectReportPage> createState() => _aubjectReportPageState();
}

class _aubjectReportPageState extends State<aubjectReportPage> {
  Widget report() {
    return Container(
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subject',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Percentage',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
