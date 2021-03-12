import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  final TextEditingController _studentnameController = TextEditingController();

  Color nameColor = Colors.grey;

  final TextEditingController _classController = TextEditingController();

  Color classColor = Colors.grey;

  final TextEditingController _sectionController = TextEditingController();

  Color sectionColor = Colors.grey;

  final TextEditingController _emailController = TextEditingController();

  Color emailColor = Colors.grey;

  final TextEditingController _phonenumberController = TextEditingController();

  Color phonenumberColor = Colors.grey;

  final TextEditingController _passwordController = TextEditingController();

  Color passwordColor = Colors.grey;

  Database db = new Database();
  TextFieldDecoration tf = new TextFieldDecoration();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Student")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new TextFieldDecoration( controller: _studentnameController, text: 'studentName', borderColor: nameColor, icon: Icons.person_outline_sharp),
            new TextFieldDecoration( controller: _classController, text: 'Class', borderColor: classColor, icon: Icons.school),
            new TextFieldDecoration( controller: _sectionController, text: 'section', borderColor: sectionColor, icon: Icons.people),
            new TextFieldDecoration( controller: _emailController, text: 'email', borderColor: emailColor, icon: Icons.email),
            new TextFieldDecoration( controller: _phonenumberController, text: 'phonenumber', borderColor: phonenumberColor, icon: Icons.phone_android_sharp),
            new TextFieldDecoration( controller: _passwordController, text: 'password', borderColor: passwordColor, icon: Icons.vpn_key_sharp),



            ElevatedButton(onPressed: (){
              if(_studentnameController.text=="" || _classController.text=="" || _sectionController.text=="" || _emailController.text=="" || _phonenumberController.text=="" || _passwordController.text=="" ){
              if(_studentnameController.text==""){
                nameColor=Colors.red;
              }

              if(_classController.text==""){


                  classColor=Colors.red;

              }
            if(_sectionController.text==""){

                  sectionColor=Colors.red;

              }
              if(_emailController.text==""){

                  emailColor=Colors.red;

              }
            if(_phonenumberController.text==""){

                  phonenumberColor=Colors.red;

              }
             if(_passwordController.text==""){

                  passwordColor=Colors.red;

              }}

              else {
                db.addStudent(
                    _studentnameController.text, _classController.text,
                    _sectionController.text, _emailController.text,
                    _phonenumberController.text, _passwordController.text);
              }  setState(() {

              });},child: Text("Add"),),
          ],




        ),
      ),
    );
  }


}
