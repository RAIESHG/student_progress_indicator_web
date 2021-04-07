import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/insert/add_student.dart';

import 'package:student_progress_indicator_web/insert/addassignment.dart';
import 'package:student_progress_indicator_web/login.dart';
import 'package:student_progress_indicator_web/reuseable_codes/student_classes.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textstyling.dart';



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
              color: Colors.blue

          ),
          child: Center(child: TextS(text:"Homepage",size: 3,color: Colors.white,)),
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
                  ButtonRow(context,"Add Daily Activity","Add Student",StudentClass(selectionoption: "activity",),AddStudent(),"dailyactivity","image"),
                  ButtonRow(context, "Add Assignment", "Edit/Delete Student",AddAssignment(),StudentClass(selectionoption:"edit"),"todo","book"),
                  ButtonRow(context, "Add Student Result", "Logout",StudentClass(selectionoption:"result"),LoginPage(),"note","logout"),],
              ),
            ),
          ],
        )
      ],
    ),
    );
  }
}
Widget ButtonRow(BuildContext context,String firsttext,String secondtext,Widget firstpage, Widget secondpage,String image1,String image2){
  return  Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonContainer(context,"$firsttext",firstpage,image1),
        ButtonContainer(context,"$secondtext",secondpage,image2),
      ],),
  );
}
Widget ButtonContainer(BuildContext context,String text, Widget page,String image){
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
          boxShadow: [BoxShadow(
            color: Colors.blue.withOpacity(0.3), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2), // changes position of shadow
          )],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
      ),child: Center(child: Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Image.asset("$image.png",width: MediaQuery.of(context).size.width*1,)),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: TextS(
            text:"$text",
            size: 1.6,
            color: Colors.blue
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    ),),),
  );


}

