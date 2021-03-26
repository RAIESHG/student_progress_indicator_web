import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
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
  MessageBox mb = new MessageBox();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Result")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextField(
              onTap: () async {
                db.getDate(_dateController, context);
              },
              controller: _dateController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range, color: dateColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color:dateColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: dateColor),
                  ),
                  labelText: 'Result date'
              ),),
            new TextFieldDecoration( controller: _subjectController, text: 'Subject', borderColor: subjectColor, icon: Icons.book),
         new TextFieldDecoration( controller: _gradesController, text: 'Grade', borderColor: gradeColor, icon: Icons.grade),



            ElevatedButton(onPressed: (){
              if(_gradesController.text=="" || _subjectController.text=="" || _dateController.text==""){
                if(_gradesController.text==""){
                  gradeColor=Colors.red;
                  mb.Display(context, "Error", "Grades Required", Colors.red);

                }
                if(_subjectController.text==""){
                  subjectColor=Colors.red;
                  mb.Display(context, "Error", "Subject Required", Colors.red);
                }
                if(_dateController.text==""){
                  dateColor=Colors.red;
                  mb.Display(context, "Error", "Date Required", Colors.red);
                }    setState(() {

                });
              }
              else{
              db.addStudentResult( _gradesController.text,_subjectController.text,widget.studentid,_dateController.text);

              Navigator.pop(context);
              mb.Display(context, "Success", "Result Added", Colors.green);



              }
              setState((){});
            },child: Text("Update"),),
          ],




        ),
      ),
    );
  }
}
