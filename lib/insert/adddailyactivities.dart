import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textfield.dart';
class DailyActivity extends StatefulWidget {
  final String studentid;

   DailyActivity({Key key, this.studentid}) : super(key: key);

  @override
  _DailyActivityState createState() => _DailyActivityState();
}

class _DailyActivityState extends State<DailyActivity> {
  @override
  final TextEditingController _dateController = TextEditingController();

  Color dateColor = Colors.grey;



  Color attendanceColor = Colors.red;

  final TextEditingController _noticeController = TextEditingController();

  Color noticeColor = Colors.grey;

  final TextEditingController _complainController = TextEditingController();

  Color complainColor = Colors.grey;

  final TextEditingController _studentidController = TextEditingController();
  List<String> attendance=["present","absent"];
  String selectedattendance="";
  MessageBox mb = new MessageBox();
  Database db = new Database();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Daily Activity")),),
      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
          onTap: () async {
            db.getDate(_dateController, context);
      },
          controller: _dateController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range, color: dateColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color:dateColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: dateColor),
              ),
              labelText: 'date'
          ),),

            DropdownSearch<String>(
              searchBoxDecoration: InputDecoration(enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: attendanceColor),
              ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: attendanceColor),
                ),
              ),
                label: "Attendance",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: attendance,
                validator: (val) =>
                val.isEmpty ? "Please  select the attendance " : null,
                onChanged: (val){
                  selectedattendance = val;
                },
                popupBarrierColor: Colors.blue.withOpacity(0.3),
                selectedItem: selectedattendance),
            new TextFieldDecoration( controller: _noticeController, text: 'notice', borderColor: noticeColor, icon: Icons.notification_important),
            new TextFieldDecoration( controller: _complainController, text: 'complain', borderColor: complainColor, icon: Icons.comment),
          ElevatedButton(onPressed: (){
            print(selectedattendance+"aaaa");
            if(_noticeController.text==""){
              _noticeController.text="-";
            }
            if(_complainController.text==""){
              _complainController.text="-";
            }
            if(_dateController.text!="" ||  selectedattendance!=""){
            db.addactivity(_dateController.text, selectedattendance, _noticeController.text,_complainController.text,widget.studentid);

            Navigator.pop(context);
           mb.Display(context, "Success", "Acitivity Added", Colors.green);
           }
            else{
              if(_dateController.text==""){
                setState((){
                  dateColor=Colors.red;
                  mb.Display(context, "Error", "Date Required", Colors.red);
                });}
                if(selectedattendance==null){
                  setState((){
                    attendanceColor=Colors.red;
                    mb.Display(context, "Error", "Attendance Required", Colors.red);
                  });
                }
             //insert validation here
            }
          },child: Text("Update"),),
        ],
        ),
      ),
    );
  }
}
