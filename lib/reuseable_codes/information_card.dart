import 'package:flutter/material.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textstyling.dart';

class InformationCard{
  Widget textinfo(String text){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(5,3,5,0),
      child: TextS(text: "$text",size: 1.5,color: Colors.blue,),
   );
  }

  Widget informationcontents(String text1){
    return   Center(child: textinfo(text1));
  }

  Widget informationcard(BuildContext context, List<Widget> information){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.blue.withOpacity(0.3), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: Offset(0, 2), // changes position of shadow
              )],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: information
          ),
        ),
      ),
    );
  }
}