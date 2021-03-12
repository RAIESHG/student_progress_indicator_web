import 'package:flutter/material.dart';

class TextFieldDecoration extends StatefulWidget {
  @override
  final TextEditingController controller;
  final String text;
  final Color borderColor;
  final IconData icon;

  const TextFieldDecoration({Key key, this.controller, this.text, this.borderColor, this.icon}) : super(key: key);


  _TextFieldDecorationState createState() => _TextFieldDecorationState();
}

class _TextFieldDecorationState extends State<TextFieldDecoration> {
  @override
  Widget build(BuildContext context) {
    return
      TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: widget.borderColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            labelText: widget.text
        ),);

  }

}
