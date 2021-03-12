import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
class AddSubject extends StatelessWidget {
  @override
  final TextEditingController _subjectnameController = TextEditingController();
  

  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Subject")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            TextField(
              controller: _subjectnameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Subject Name'
              ),
            ),
            RaisedButton(onPressed: (){
              db.addSubject(_subjectnameController.text);
            },child: Text("Add"),),
          ],




        ),
      ),
    );
  }
}
