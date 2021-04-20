import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  static const routeName = 'reports';

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      title: Text(
        'Reports',
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
    ));
  }
}
