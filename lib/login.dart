import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/reuseable_codes/message_box.dart';
import 'package:student_progress_indicator_web/reuseable_codes/textstyling.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String username = '';
  String password = '';
  String error = '';
  String b = "";
  Color purcolor = Colors.blue;

  MessageBox mb = new MessageBox();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height*0.1,0,0),
                    child: TextS(
                        text:"Student Progress Indicator Admin",size:3,color:Colors.blue
                    ),
                  ),
                ),




                Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: purcolor,
                                    ),
                                    hintText: "username",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    fillColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: purcolor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 6.0)),
                                onChanged: (val) {
                                  setState(() => username = val);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: purcolor,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(),
                                    fillColor: Colors.white,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: purcolor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 16.0)),
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ),

                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  color: purcolor,
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      if (username.isEmpty || password.isEmpty) {
                                        mb.Display(
                                            context,
                                            "Username/Password Required!",
                                            "Please Enter Your Username/Password",
                                            Colors.red);
                                      } else {
                                        if (username=='admin' && password=='admin') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Dashboard()),
                                          );
                                          mb.Display(context, "Login Successful",
                                              "Welcome", Colors.blue);
                                        }
                                        else{
                                          mb.Display(context, "Error",
                                              "Incorrect Username/Password Please Try Again", Colors.red);

                                        }
                                      }
                                    }
                                  },
                                  elevation: 11,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                                  child: Text("Login",
                                  ),
                                ),
                              ),
                            ),


                            Expanded(
                              flex: 3,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
