import 'package:flutter/material.dart';

class Quizzes extends StatefulWidget {
  static const routeName = 'quizzes';
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Quizzes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Quizzes',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )));
  }
}