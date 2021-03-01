import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';

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
      appBar: AppBar(title: Center(child: Text("Add Student")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              controller: _studentnameController,

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
                  labelText: 'studentName'
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
                  labelText: 'section'
              ),
            ),
            TextField(
              controller: _emailController,

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
                  labelText: 'email'
              ),
            ),
            TextField(
              controller: _phonenumberController,

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
                  labelText: 'phonenumber'
              ),
            ),
            TextField(
              controller: _passwordController,

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
                  labelText: 'password'
              ),
            ),
            RaisedButton(onPressed: (){

              db.addStudent(_studentnameController.text,_classController.text,_sectionController.text,_emailController.text,_phonenumberController.text,_passwordController.text);
            },child: Text("Add"),),
          ],




        ),
      ),
    );
  }
}
