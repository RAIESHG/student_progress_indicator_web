import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/database.dart';
class AddSubject extends StatelessWidget {
  @override
  final TextEditingController _subjectnameController = TextEditingController();
  

  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _subjectnameController,

            decoration: InputDecoration(
                labelText: 'Subject Name'
            ),
          ),
       
          RaisedButton(onPressed: (){

            db.addSubject(_subjectnameController.text);
          },child: Text("Add"),),
        ],




      ),
    );
  }
}
