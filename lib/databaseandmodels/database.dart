import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_web/databaseandmodels/student_model.dart';
import 'package:student_progress_indicator_web/main.dart';
import 'dart:convert';

class Database {

  Future<int> addactivity(String date, String attendance,String notice,String complain,String studentid) async {
    var res = await http.post(
        "http://$IP/activity",
        body: {
          "date":date,
          "attendance": attendance,
          "notice": notice,
          "complain":complain,
          "studentid":studentid,
        });
    return res.statusCode;
  }

  Future<int> addStudent(String studentname,String clas,String section,String email,String phonenumber,String password ) async {
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
    return res.statusCode;
  }

  Future<int> addassignment(String assignment, String assigndate,String duedate,String subject,String _class,String section) async {
    var res = await http.post(
        "http://$IP/addassignment",
        body: {
          "assignment":assignment,
          "assigndate":assigndate,
          "duedate":duedate,
          "subject":subject,
          "_class":_class,
          "section":section,
        }
    );
    return res.statusCode;
  }

  Future<int> addSubject(String subject) async {
    var res = await http.post(
        "http://$IP/addsubject",
        body: {
          "subjectname":subject,
        }
    );
    return res.statusCode;
  }

  Future<int> addStudentResult(String grade,String subject,String studentid,String date) async {
    var res = await http.post(
        "http://$IP/addresult",
        body: {
          "grade":grade,
          "subject":subject,
          "studentid":studentid,
          "date":date,
        }
    );
    return res.statusCode;
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
        );
      studentinfolist.add(studentobj);
    }
    return studentinfolist;
  }
}