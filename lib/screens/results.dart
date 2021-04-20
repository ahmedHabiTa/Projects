import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text(
              'Results',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )),


    );
  }
}