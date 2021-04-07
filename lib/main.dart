import 'package:flutter/material.dart';

import 'package:student_progress_indicator_web/dashboard.dart';
import 'package:student_progress_indicator_web/login.dart';

const IP = '192.168.2.12:3000';
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard()));
}

