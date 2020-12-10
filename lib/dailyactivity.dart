import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/database.dart';
class DailyActivity extends StatelessWidget {
  @override
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _attendanceController = TextEditingController();
  final TextEditingController _noticeController = TextEditingController();
  final TextEditingController _complainController = TextEditingController();
  final TextEditingController _studentidController = TextEditingController();

  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        TextField(
          controller: _dateController,
          decoration: InputDecoration(
              labelText: 'date'
                  ''
          ),
        ),
        TextField(
          controller: _attendanceController,
          decoration: InputDecoration(
              labelText: 'attendance'
          ),
        ),
        TextField(
          controller: _noticeController,

          decoration: InputDecoration(
              labelText: 'notice'
          ),
        ),
        TextField(
          controller: _complainController,

          decoration: InputDecoration(
              labelText: 'complain'
          ),
        ),
        TextField(
          controller: _studentidController,

          decoration: InputDecoration(
              labelText: 'studentid'
          ),
        ),
        RaisedButton(onPressed: (){
          db.addactivity(_dateController.text, _attendanceController.text, _noticeController.text,_complainController.text,_studentidController.text);
        },child: Text("Update"),),
      ],




      ),
    );
  }
}
