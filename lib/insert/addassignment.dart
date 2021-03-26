import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  MessageBox mb = new MessageBox();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Assignment")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            new TextFieldDecoration( controller: _assignmentController, text: 'assignment', borderColor: assignmentColor, icon: Icons.assignment),
          TextField(
            onTap:() async {
              db.getDate(_assigndateController,context);

            },
            controller: _assigndateController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.date_range, color: assigndateColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: assigndateColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: assigndateColor),
                ),
                labelText: 'assigndate'
            ),),
            TextField(
              onTap:() async {
                db.getDate(_duedateController,context);

              },
              controller: _duedateController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range_outlined, color: duedateColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: duedateColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: duedateColor),
                  ),
                  labelText: '_duedate'
              ),),

            new TextFieldDecoration( controller: _subjectController, text: 'Subject', borderColor: subjectColor, icon: Icons.book_outlined),
            new TextFieldDecoration( controller: _classController, text: 'Class', borderColor: classColor, icon: Icons.school),
            new TextFieldDecoration( controller: _sectionController, text: 'Section', borderColor: sectionColor, icon: Icons.people),

            ElevatedButton(onPressed: (){
              if(_assignmentController.text=="" || _assigndateController.text=="" ||  _duedateController.text=="" || _subjectController.text=="" || _classController.text=="" || _sectionController.text==""){

                if(_assignmentController.text==""){
                assignmentColor=Colors.red;mb.Display(context, "Error", "Assignment Required", Colors.red);

              }
              if(_assigndateController.text==""){
                assigndateColor=Colors.red;
                mb.Display(context, "Error", "AssignDate Required", Colors.red);

              }
              if(_duedateController.text==""){
                duedateColor=Colors.red;
                mb.Display(context, "Error", "Wrong Email/Password", Colors.red);

              }
              if(_subjectController.text==""){
                subjectColor=Colors.red;
                mb.Display(context, "Error", "Subject Required", Colors.red);

              }
              if(_classController.text==""){
                classColor=Colors.red;
                mb.Display(context, "Error", "Wrong Email/Password", Colors.red);

              }
              if(_sectionController.text==""){
                sectionColor=Colors.red;
                mb.Display(context, "Error", "Section Required", Colors.red);
              }    setState(() {

                });}
              else{
               db.addassignment(_assignmentController.text, _assigndateController.text, _duedateController.text,_subjectController.text,_classController.text,_sectionController.text);

               Navigator.pop(context);
              mb.Display(context, "Success", "Assignment Added", Colors.green);}
             }

            ,child: Text("Update"),),
          ],




        ),
      ),
    );
  }

}
