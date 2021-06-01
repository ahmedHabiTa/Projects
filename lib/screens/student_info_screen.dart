import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/providers/auth.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    return Scaffold(
        appBar: AppBar(
            title: Text(
      'Student information',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    )));
  }
}
