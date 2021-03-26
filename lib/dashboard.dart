import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/insert/add_student.dart';
import 'package:student_progress_indicator_web/insert/add_subject.dart';
import 'package:student_progress_indicator_web/insert/addassignment.dart';
import 'package:student_progress_indicator_web/reuseable_codes/student_classes.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.28,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.6)

          ),
          child: Center(child: Text("Dashboard",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ),

        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonRow(context,"Add Daily Activity","Add Student",StudentClass(selectionoption: "activity",),AddStudent()),
                  ButtonRow(context, "Add Assignment", "Add Subject",AddAssignment(),AddSubject()),
                  ButtonRow(context, "Add Student Result", "Edit/Delete",StudentClass(selectionoption:"result"),StudentClass(selectionoption:"edit")),],
              ),
            ),
          ],
        )
      ],
    ),
    );
  }
}
Widget ButtonRow(BuildContext context,String firsttext,String secondtext,Widget firstpage, Widget secondpage){
  return  Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonContainer(context,"$firsttext",firstpage),
        ButtonContainer(context,"$secondtext",secondpage),
      ],),
  );
}
Widget ButtonContainer(BuildContext context,String text, Widget page){
  return InkWell(
    onTap: (){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    child: Container(
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width*0.3,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),


          color: Colors.blue.withOpacity(0.8)

      ),child: Center(child: Text("$text"),),),
  );

}

