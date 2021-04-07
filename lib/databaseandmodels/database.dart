import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_web/databaseandmodels/student_model.dart';
import 'package:student_progress_indicator_web/main.dart';
import 'dart:convert';

class Database {

  Future<int> addactivity(String date, String attendance,String notice,String complain,String studentid) async {
    var status;

    try{

    var res = await http.post(
        "http://$IP/activity",
        body: {
          "date":date,
          "attendance": attendance,
          "notice": notice,
          "complain":complain,
          "studentid":studentid,
        });
    print("hi");
    status=res.statusCode;
    print(status);
    }
        catch(e){
      print(e);
      status = 404;
        }
    return status;
  }

  Future<int> addStudent(String studentname,String clas,String section,String email,String phonenumber,String password ) async {
    var status;
    try{
    var res = await http.post(
        "http://$IP/addstudent",
        body: {
          "studentname":studentname,
          "_class":clas,
          "section":section,
          "email":email,
          "phonenumber":phonenumber,
          "password":password,}
    );
    status=res.statusCode;}
    catch(e){
      status=404;
    }

    return status;
  }

  Future<int> updateStudent(String studentname,String clas,String section,String email,String phonenumber,String id ) async {
    var status;
    try{
    var res = await http.post(
        "http://$IP/updatestudent",
        body: {
          "studentname":studentname,
          "_class":clas,
          "section":section,
          "email":email,
          "phonenumber":phonenumber,
          "studentid":id,}
    );status=res.statusCode;}
    catch(e){
      status=404;
    }
    return status;
  }
  Future<int> deleteStudent(String id) async {
    var status;
    try{
    var res = await http.get(
        "http://$IP/deletestudent?studentid=$id",
    );
    status=res.statusCode;
    }catch(e){

      status=404;
    }
    return status;
  }

  Future<int> addassignment(String assignment, String assigndate,String duedate,String subject,String _class,String section) async {
    var status;
    try{
    var res = await http.post(
        "http://$IP/addassignment",
        body: {
          "assignment":assignment,
          "assigndate":assigndate,
          "duedate":duedate,
          "subjectname":subject,
          "_class":_class,
          "section":section,

        }
    );status=res.statusCode;
    }catch(e){
      status=404;
    }
    return status;
  }

  Future<int> addSubject(String subject) async {
    var status;
    try{
    var res = await http.post(
        "http://$IP/addsubject",
        body: {
          "subjectname":subject,
        }
    );status=res.statusCode;}catch(e){status=404;}
    return status;
  }

  Future<int> addStudentResult(String grade,String subject,String studentid,String date) async {
    var status;
    try{
    var res = await http.post(
        "http://$IP/addresult",
        body: {
          "grade":grade,
          "subject":subject,
          "studentid":studentid,
          "date":date,
        }
    );status=res.statusCode;}catch(e){status=404;}
    return status;
  }
  Future<int> addresult( String terminal,String date) async {

    var res = await http.post(
        "http://$IP/addassignment",
        body: {
          "terminal":terminal,
          "date":date,
        }
    );
    return res.statusCode;
  }
  Future<List<StudentModel>> fetchstudent(String classs,String section) async {
    var response;
    int statusCode;
    var data = await http.get('http://$IP/getstudents?classs=$classs&section=$section');
    var jsonData = json.decode((data.body));
    List<StudentModel> studentinfolist = [];
    print(jsonData);
    for (var each in jsonData) {
      StudentModel studentobj = StudentModel(
          id: each["studentid"].toString()
          ,name:each["studentname"],
        email:each["email"],
        classs:each["class"],
        section:each["section"],
        phonenumber:each["phonenumber"]
        );
      studentinfolist.add(studentobj);
    }
    return studentinfolist;
  }
  Future<DateTime> getDate(TextEditingController text, BuildContext context){
    return DatePicker.showDatePicker(context,
        showTitleActions: true,

        theme: DatePickerTheme(
            headerColor: Colors.white,
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.blue, fontSize: 16)),
        onConfirm: (date) {

          text.text='${date.year}-${date.month}-${date.day}';


        }, currentTime: DateTime.now(), locale: LocaleType.en);


  }
}