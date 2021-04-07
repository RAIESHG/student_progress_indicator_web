import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/editanddelete/edit_student.dart';
import 'package:student_progress_indicator_web/insert/add_student_result.dart';
import 'package:student_progress_indicator_web/insert/adddailyactivities.dart';
import 'package:student_progress_indicator_web/reuseable_codes/information_card.dart';
import 'package:student_progress_indicator_web/reuseable_codes/loadingscreen.dart';
import 'package:student_progress_indicator_web/reuseable_codes/nodata.dart';



class ViewStudents extends StatefulWidget {
  @override
  final String classs;
  final String section;
  final String selectedoption;

  const ViewStudents({Key key, this.classs, this.section, this.selectedoption}) : super(key: key);
  _ViewStudentsState createState() => _ViewStudentsState();
}
Database db = Database();
InformationCard ic= InformationCard();
List<Widget> information;
class _ViewStudentsState extends State<ViewStudents> {
  @override
  Widget build(BuildContext context) {
    print("${widget.classs}+${widget.section}");

    return  Scaffold(

        appBar: AppBar(
          title: Center(child: Text("Select Student")),
        ),
        backgroundColor: Colors.white.withOpacity(0.1),
        body: FutureBuilder(
            future: db.fetchstudent("${widget.classs}","${widget.section}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.data != null) {
    int count = snapshot.data.length;
    if(count>=1){
                return (GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 3/ 2,
                        crossAxisSpacing: 40,
                       ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {

                      information=[ic.informationcontents(snapshot.data[index].name+"\n"+"ID: "+snapshot.data[index].id+""),];
                      return InkWell(
                          onTap: (){
                            if(widget.selectedoption=="activity"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DailyActivity(studentid: snapshot.data[index].id,name:snapshot.data[index].name)),
                            );}
                            else if(widget.selectedoption=="result"){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddStudentResult(studentid: snapshot.data[index].id,name:snapshot.data[index].name)),);
                            }
                            else if(widget.selectedoption=="edit"){

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditStudent(studentid:snapshot.data[index].id,studentname: snapshot.data[index].name,classs: snapshot.data[index].classs,section: snapshot.data[index].section,email: snapshot.data[index].email,phonenumber:snapshot.data[index].phonenumber ,)),);
                            }
                          },
                          child: ic.informationcard(context,information));
                    }));
              } else{
      return NoData();
    }}else{
                return LoadingScreen();
              }
            }));
  }
}

