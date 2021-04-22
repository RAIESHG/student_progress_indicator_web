import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';

class EditStudent extends StatefulWidget {
  @override
  final String studentid;
 final String studentname;
  final String classs;
  final String section;
  final String email;
  final String phonenumber;
  final String password;

  const EditStudent({Key key,this.studentid, this.studentname, this.classs, this.section, this.email, this.phonenumber,this.password}) : super(key: key);

  _EditStudentState createState() => _EditStudentState();
}
class _EditStudentState extends State<EditStudent> {
  MessageBox mb = new MessageBox();
  @override
  final TextEditingController _studentnameController = TextEditingController();

  Color nameColor = Colors.blue.withOpacity(0.7);
  final TextEditingController _classController = TextEditingController();
  Color classColor = Colors.blue.withOpacity(0.7);
  final TextEditingController _sectionController = TextEditingController();
  Color sectionColor = Colors.blue.withOpacity(0.7);
  final TextEditingController _emailController = TextEditingController();
  Color emailColor = Colors.blue.withOpacity(0.7);
  final TextEditingController _phonenumberController = TextEditingController();
  Color phonenumberColor = Colors.blue.withOpacity(0.7);
  final TextEditingController _passwordController = TextEditingController();
  Color passwordColor = Colors.blue.withOpacity(0.7);



  Database db = new Database();
  TextFieldDecoration tf = new TextFieldDecoration();

  Widget build(BuildContext context) {
    _studentnameController.text = widget.studentname;
    _classController.text = widget.classs;
    _sectionController.text = widget.section;
    _emailController.text = widget.email;
    _phonenumberController.text=widget.phonenumber;

        return Scaffold(
      appBar: AppBar(title: Center(child: Text("Edit/Delete Student")),),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  if(_studentnameController.text=="" || _classController.text=="" || _sectionController.text=="" || _emailController.text=="" || _phonenumberController.text=="" || _passwordController.text==""){
                    if(_studentnameController.text==""){
                      nameColor=Colors.red;
                      mb.Display(context, "Error", "Name Required!", Colors.red);
                    }
                    if(_classController.text==""){
                      classColor=Colors.red;
                      mb.Display(context, "Error", "Class Requried", Colors.red);
                    }
                    if(_sectionController.text==""){
                      sectionColor=Colors.red;
                      mb.Display(context, "Error", "Section Required", Colors.red);
                    }
                    if(_emailController.text==""){
                      emailColor=Colors.red;
                      mb.Display(context, "Error", "Email Required", Colors.red);
                    }
                    if(_phonenumberController.text==""){
                      phonenumberColor=Colors.red;
                      mb.Display(context, "Error", "PhoneNumber Required", Colors.red);
                    }
                    if(_passwordController.text==""){
                      phonenumberColor=Colors.red;
                      mb.Display(context, "Error", "Password Required", Colors.red);
                    }
                       setState(() {

                    });}


                  else {
                    db.updateStudent(
                        _studentnameController.text, _classController.text,
                        _sectionController.text, _emailController.text,
                        _phonenumberController.text, widget.studentid);
                    Navigator.pop(context);

                    mb.Display(context, "Success", "Student Updated", Colors.green);

                  }
                },child: Text("Update"),),

                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: (){

                  db.deleteStudent(
                      widget.studentid);
                  Navigator.pop(context);

                  mb.Display(context, "Success", "Student Deleted", Colors.green);


                },child: Text("Delete"),),],
            ),SizedBox(height: MediaQuery.of(context).size.height*0.3,),

          ],




        ),
      ),
    );
  }


}
