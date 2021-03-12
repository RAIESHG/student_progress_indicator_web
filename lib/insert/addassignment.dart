import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';
class AddAssignment extends StatefulWidget {
  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  @override
  final TextEditingController _assignmentController = TextEditingController();

  Color assignmentColor = Colors.grey;

  final TextEditingController _assigndateController = TextEditingController();

  Color assigndateColor = Colors.grey;

  final TextEditingController _duedateController = TextEditingController();

  Color duedateColor = Colors.grey;

  final TextEditingController _subjectController = TextEditingController();

  Color subjectColor = Colors.grey;

  final TextEditingController _classController = TextEditingController();

  Color classColor = Colors.grey;

  final TextEditingController _sectionController = TextEditingController();

  Color sectionColor = Colors.grey;

  Database db = new Database();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Assignment")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            new TextFieldDecoration( controller: _assignmentController, text: 'assignment', borderColor: assignmentColor, icon: Icons.assignment),
            new TextFieldDecoration( controller: _assigndateController, text: 'assigndate', borderColor: assigndateColor, icon: Icons.date_range),
            new TextFieldDecoration( controller: _duedateController, text: 'duedate', borderColor: duedateColor, icon: Icons.date_range_outlined),
            new TextFieldDecoration( controller: _subjectController, text: 'Subject', borderColor: subjectColor, icon: Icons.book_outlined),
            new TextFieldDecoration( controller: _classController, text: 'Class', borderColor: classColor, icon: Icons.school),
            new TextFieldDecoration( controller: _sectionController, text: 'Section', borderColor: sectionColor, icon: Icons.people),

            ElevatedButton(onPressed: (){
              if(_assignmentController.text=="" || _assigndateController.text=="" ||  _duedateController.text=="" || _subjectController.text=="" || _classController.text=="" || _sectionController.text==""){

                if(_assignmentController.text==""){
                assignmentColor=Colors.red;
              }
              if(_assigndateController.text==""){
                assigndateColor=Colors.red;

              }
              if(_duedateController.text==""){
                duedateColor=Colors.red;

              }
              if(_subjectController.text==""){
                subjectColor=Colors.red;

              }
              if(_classController.text==""){
                classColor=Colors.red;

              }
              if(_sectionController.text==""){
                sectionColor=Colors.red;
              }}
              else{
               db.addassignment(_assignmentController.text, _assigndateController.text, _duedateController.text,_subjectController.text,_classController.text,_sectionController.text);
              }
              setState(() {});}

            ,child: Text("Update"),),
          ],




        ),
      ),
    );
  }
}
