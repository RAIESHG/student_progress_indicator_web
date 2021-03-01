import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
class AddStudentResult extends StatelessWidget {
  final String studentid;
  @override

  final TextEditingController _gradesController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();


  final TextEditingController _dateController = TextEditingController();

  Database db = new Database();

  AddStudentResult({Key key, this.studentid}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Result")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextField(
              controller: _dateController,

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
                  labelText: 'Result Date'
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
              controller: _gradesController,

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
                  labelText: 'Grade'
              ),
            ),

            RaisedButton(onPressed: (){
              db.addStudentResult( _gradesController.text,_subjectController.text,studentid,_dateController.text);
            },child: Text("Update"),),
          ],




        ),
      ),
    );
  }
}
