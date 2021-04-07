import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}
class _AddStudentState extends State<AddStudent> {
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
  Color passwordColor =Colors.blue.withOpacity(0.7);
  Database db = new Database();
  TextFieldDecoration tf = new TextFieldDecoration();




  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Student")),),
      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 20, 30,20),
        child: Column(

          children: [

             TextFieldDecoration( controller: _studentnameController, text: 'studentName', borderColor: nameColor, icon: Icons.person_outline_sharp),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            TextField(onChanged: (value){
              if(value.contains(RegExp('[a-zA-Z]'))){

                mb.Display(context, "Warning", "Only Number Input Allowed in Class", Colors.red);
                _classController.text="";
              }

            },

              controller:_classController,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.school, color: classColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: classColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: classColor),
                  ),
                  labelText: 'Class'
              ),),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),


             TextFieldDecoration( controller: _sectionController, text: 'section', borderColor: sectionColor, icon: Icons.people),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
             TextFieldDecoration( controller: _emailController, text: 'email', borderColor: emailColor, icon: Icons.email),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            TextField(
              controller:_phonenumberController,
              onChanged: (value){
                if(value.contains(RegExp('[a-zA-Z]'))){

                  mb.Display(context, "Warning", "Only Number Input Allowed in PhoneNumber", Colors.red);
                  _phonenumberController.text="";
                }

              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_sharp, color: phonenumberColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: phonenumberColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: phonenumberColor),
                  ),
                  labelText: 'Phonenumber'
              ),),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            TextField(
              obscureText: true,
              controller:_passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_sharp, color: passwordColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: passwordColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: passwordColor),
                  ),
                  labelText: 'password'
              ),),

            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            ElevatedButton(onPressed: (){
              if(_studentnameController.text=="" || _classController.text=="" || _sectionController.text=="" || _emailController.text=="" || _phonenumberController.text=="" || _passwordController.text=="" ){
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
                  passwordColor=Colors.red;
                  mb.Display(context, "Error", "Password Required", Colors.red);

              }    setState(() {
              });}
             else {

               void validation() async {
                var res =await db.addStudent(
                    _studentnameController.text, _classController.text,
                    _sectionController.text, _emailController.text,
                    _phonenumberController.text, _passwordController.text);

                if(res==201){
                Navigator.pop(context);
                mb.Display(context, "Success", "Student Added", Colors.green);}
                else if(res==409){
                  mb.Display(context, "Failure", "Student With Same Email Address Already Exists", Colors.red);

                }
                else{
                  mb.Display(context, "Error Occured", "Please Check Your Internet Connection", Colors.red);
                }
              }validation();}
             },child: Text("Add Student"),),
          ],
        ),
      ),
    );
  }
}
