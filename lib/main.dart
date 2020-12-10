import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/add_student.dart';
import 'package:student_progress_indicator_web/add_subject.dart';
import 'package:student_progress_indicator_web/addassignment.dart';
import 'package:student_progress_indicator_web/dailyactivity.dart';
const IP = 'http://192.168.1.7:3000';
void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RaisedButton(onPressed: (){  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyActivity()),
          );},child: Text("Daily Activities"),),
          RaisedButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudent()),
          );},child: Text("Add Student"),),
          RaisedButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAssignment()),
          );},child: Text("Add Assignment"),),

          RaisedButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubject()),
          );},child: Text("Add Subject"),),
        ],


      ),
    );
  }
}

