import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
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
  List<String> section=["A","B"];
  String selectedclass="";
  String selectedsection="";
  MessageBox mb = new MessageBox();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Select Class")),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(selectedclass=="" || selectedsection==""){
            mb.Display(context, "Warning", "Please Select Both Section And Class", Colors.red);
          }
          else{
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewStudents(classs: selectedclass,section: sectionController.text,selectedoption: widget.selectionoption,)));
        }
          },
        child: Text("Next"),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,0),
            child: DropdownSearch<String>(
                label: "Class",
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
              SizedBox(height:MediaQuery.of(context).size.height*0.03),

              Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: DropdownSearch<String>(
                    label: "Section",
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: section,

                    validator: (val) =>
                    val.isEmpty ? "Please  select the Time " : null,

                    onChanged: (val){
                      selectedsection = val;
                    },
                    selectedItem: selectedsection),
              ),




    ],),
        ),
      ),);
  }
}
