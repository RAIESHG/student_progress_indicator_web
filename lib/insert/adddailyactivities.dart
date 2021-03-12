import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
class DailyActivity extends StatelessWidget {
  final String studentid;
  @override
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _attendanceController = TextEditingController();
  final TextEditingController _noticeController = TextEditingController();
  final TextEditingController _complainController = TextEditingController();
  final TextEditingController _studentidController = TextEditingController();

  Database db = new Database();

   DailyActivity({Key key, this.studentid}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Daily Activity")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
          TextField(
            controller: _dateController,
            decoration: InputDecoration(

                prefixIcon: Icon(Icons.date_range, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'date'
                    ''
            ),
          ),
          TextField(
            controller: _attendanceController,
            decoration: InputDecoration(

                prefixIcon: Icon(Icons.fact_check, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'attendance'
            ),
          ),
          TextField(
            controller: _noticeController,

            decoration: InputDecoration(

                prefixIcon: Icon(Icons.notification_important, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'notice'
            ),
          ),
          TextField(
            controller: _complainController,

            decoration: InputDecoration(

                prefixIcon: Icon(Icons.comment, color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'complain'
            ),
          ),

          RaisedButton(onPressed: (){
            if(_noticeController.text==""){
              _noticeController.text="-";
            }
            if(_complainController.text==""){
              _complainController.text="-";

            }
            if(_dateController.text!="" ||  _attendanceController.text!=""){
            db.addactivity(_dateController.text, _attendanceController.text, _noticeController.text,_complainController.text,studentid);}
            else{

              //insert validation here
            }
          },child: Text("Update"),),
        ],
        ),
      ),
    );
  }
}
