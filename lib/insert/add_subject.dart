import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/databaseandmodels/database.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
class AddSubject extends StatelessWidget {
  @override
  final TextEditingController _subjectnameController = TextEditingController();
  

  Database db = new Database();
  MessageBox mb = new MessageBox();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Subject")),),

      body: Padding(
        padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: _subjectnameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Subject Name'
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            ElevatedButton(onPressed: (){
              if(_subjectnameController.text==""){
                mb.Display(context, "Error", "Donot Leave Empty", Colors.red);
              }else{
              db.addSubject(_subjectnameController.text);
              Navigator.pop(context);
              mb.Display(context, "Success", "Subject Added", Colors.green);
                            }
            },child: Text("Add"),),
          ],




        ),
      ),
    );
  }
}
