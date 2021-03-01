import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:student_progress_indicator_web/reuseable_codes/view_students.dart';


class StudentClass extends StatefulWidget {
  @override
  final String selectionoption;

 StudentClass({Key key, this.selectionoption}) : super(key: key);
  _StudentClassState createState() => _StudentClassState();
}
final TextEditingController sectionController = TextEditingController();
class _StudentClassState extends State<StudentClass> {
  @override
  List<String> classes = ["1", "2","3","4","5","6","7","8","9","10"];
  String selectedclass="";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Select Class")),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){


          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewStudents(classs: selectedclass,section: sectionController.text,selectedoption: widget.selectionoption,)));

        },
        child: Text("Next"),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(

            children: [
          TextField(
            controller:sectionController ,
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
                labelText: 'Section'
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,0),
            child: DropdownSearch<String>(
                label: "Shift",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: classes,

                validator: (val) =>
                val.isEmpty ? "Please  select the Time " : null,

                onChanged: (val){
                  selectedclass = val;
                },
                selectedItem: selectedclass),
          ),




    ],),
        ),
      ),);
  }
}
