import 'package:flutter/material.dart';

class Banks extends StatefulWidget {
  static const routeName = 'banks';
  @override
  _BanksState createState() => _BanksState();
}

class _BanksState extends State<Banks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text(
              'Banks1',
              style:Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )));
  }
}