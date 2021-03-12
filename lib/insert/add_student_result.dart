import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';
class AddStudentResult extends StatefulWidget {
  final String studentid;

  AddStudentResult({Key key, this.studentid}) : super(key: key);

  @override
  _AddStudentResultState createState() => _AddStudentResultState();
}

class _AddStudentResultState extends State<AddStudentResult> {
  @override

  final TextEditingController _gradesController = TextEditingController();

  Color gradeColor = Colors.grey;

  final TextEditingController _subjectController = TextEditingController();

  Color subjectColor = Colors.grey;

  final TextEditingController _dateController = TextEditingController();

  Color dateColor = Colors.grey;

  Database db = new Database();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Result")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            new TextFieldDecoration( controller: _dateController, text: 'Result Date', borderColor: gradeColor, icon: Icons.date_range_outlined),
            new TextFieldDecoration( controller: _subjectController, text: 'Subject', borderColor: subjectColor, icon: Icons.book),
         new TextFieldDecoration( controller: _gradesController, text: 'Grade', borderColor: gradeColor, icon: Icons.grade),



            RaisedButton(onPressed: (){
              if(_gradesController.text=="" || _subjectController.text=="" || _dateController.text==""){
                if(_gradesController.text==""){
                  gradeColor=Colors.red;

                }
                if(_subjectController.text==""){
                  subjectColor=Colors.red;
                }
                if(_dateController.text==""){
                  dateColor=Colors.red;
                }
              }
              else{
              db.addStudentResult( _gradesController.text,_subjectController.text,widget.studentid,_dateController.text);}
              setState((){});
            },child: Text("Update"),),
          ],




        ),
      ),
    );
  }
}
