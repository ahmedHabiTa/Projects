import 'package:flutter/material.dart';
class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Student information',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )));
  }
}
