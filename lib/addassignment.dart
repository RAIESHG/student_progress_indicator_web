import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/database.dart';
class AddAssignment extends StatelessWidget {
  @override
  final TextEditingController _assignmentController = TextEditingController();
  final TextEditingController _assigndateController = TextEditingController();
  final TextEditingController _duedateController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  final TextEditingController _sectionController = TextEditingController();

  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _assignmentController,
            decoration: InputDecoration(
                labelText: 'assignment'
                    ''
            ),
          ),
          TextField(
            controller: _assigndateController,
            decoration: InputDecoration(
                labelText: 'assigndate'
            ),
          ),
          TextField(
            controller: _duedateController,

            decoration: InputDecoration(
                labelText: 'duedate'
            ),
          ),
          TextField(
            controller: _subjectController,

            decoration: InputDecoration(
                labelText: 'Subject'
            ),
          ),
          TextField(
            controller: _classController,

            decoration: InputDecoration(
                labelText: 'Class'
            ),
          ),
          TextField(
            controller: _sectionController,

            decoration: InputDecoration(
                labelText: 'Section'
            ),
          ),
          RaisedButton(onPressed: (){
            db.addassignment(_assignmentController.text, _assigndateController.text, _duedateController.text,_subjectController.text,_classController.text,_sectionController.text);
          },child: Text("Update"),),
        ],




      ),
    );
  }
}
