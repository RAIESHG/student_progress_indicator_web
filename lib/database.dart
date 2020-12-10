import 'package:http/http.dart' as http;
import 'package:student_progress_indicator_web/main.dart';

class Database {

  Future<int> addactivity(String date, String attendance,String notice,String complain,String studentid) async {
    var res = await http.post(
        "$IP/activity",
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
        "$IP/addstudent",
        body: {
          "studentname":studentname,
          "_class":clas,
          "section":section,
          "email":email,
          "phonenumber":phonenumber,
          "password":password,
        }
    );
    return res.statusCode;
  }

  Future<int> addassignment(String assignment, String assigndate,String duedate,String subject,String _class,String section) async {
    var res = await http.post(
        "$IP/addassignment",
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
        "$IP/addsubject",
        body: {
          "subjectname":subject,

        }
    );
    return res.statusCode;
  }
}