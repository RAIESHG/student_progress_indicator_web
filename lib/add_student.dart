import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/database.dart';
class AddStudent extends StatelessWidget {
  @override
  final TextEditingController _studentnameController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Database db = new Database();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          TextField(
            controller: _studentnameController,

            decoration: InputDecoration(
                labelText: 'studentName'
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
                labelText: 'section'
            ),
          ),
          TextField(
            controller: _emailController,

            decoration: InputDecoration(
                labelText: 'email'
            ),
          ),
          TextField(
            controller: _phonenumberController,

            decoration: InputDecoration(
                labelText: 'phonenumber'
            ),
          ),
          TextField(
            controller: _passwordController,

            decoration: InputDecoration(
                labelText: 'password'
            ),
          ),
          RaisedButton(onPressed: (){

            db.addStudent(_studentnameController.text,_classController.text,_sectionController.text,_emailController.text,_phonenumberController.text,_passwordController.text);
          },child: Text("Add"),),
        ],




      ),
    );
  }
}
