import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
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
      appBar: AppBar(title: Center(child: Text("Add Assignment")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextField(
              controller: _assignmentController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'assignment'
              ),
            ),
            TextField(
              controller: _assigndateController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'assigndate'
              ),
            ),
            TextField(
              controller: _duedateController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'duedate'
              ),
            ),
            TextField(
              controller: _subjectController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Subject'
              ),
            ),
            TextField(
              controller: _classController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Class'
              ),
            ),
            TextField(
              controller: _sectionController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.money, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Section'
              ),
            ),
            RaisedButton(onPressed: (){
              db.addassignment(_assignmentController.text, _assigndateController.text, _duedateController.text,_subjectController.text,_classController.text,_sectionController.text);
            },child: Text("Update"),),
          ],




        ),
      ),
    );
  }
}
