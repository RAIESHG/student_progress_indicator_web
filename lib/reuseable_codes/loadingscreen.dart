import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textstyling.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: Center(child: Lottie.asset("assets/loading.json"))),
          TextS(text:"Loading..Please Check Your Internet Connection",size: 1.8,color: Colors.black,),


        ],
      ),
    );
  }
}
