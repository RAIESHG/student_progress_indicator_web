import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/insert/add_student_result.dart';
import 'package:student_progress_indicator_web/insert/adddailyactivities.dart';
import 'package:student_progress_indicator_web/reuseable_codes/information_card.dart';



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
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Students")),
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder(
            future: db.fetchstudent("5","A"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return (ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      information=[ic.informationcontents("Name:"+snapshot.data[index].name,"id: "+snapshot.data[index].id),
                      ];
                      return InkWell(
                          onTap: (){
                            if(widget.selectedoption=="activity"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DailyActivity(studentid: snapshot.data[index].id,)),
                            );}
                            else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddStudentResult(studentid: snapshot.data[index].id,)),
                              );



                            }


                          },

                          child: ic.informationcard(context,information));
                    }));
              }else{
                return CircularProgressIndicator();
              }
            }));
  }
}

