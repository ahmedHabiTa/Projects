import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../model/user.dart';

import '../../providers/auth.dart';

class ExamsTable extends StatefulWidget {
  static const routeName = '/examsTable';

  @override
  _ExamsTableState createState() => _ExamsTableState();
}

class _ExamsTableState extends State<ExamsTable> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    return Scaffold(
        appBar: new AppBar(
            title: Text(
          'Exams Table',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        )),
        body: Container(
            margin: EdgeInsets.all(5),
            child: Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text('Name :${user.name}',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(
                        child: Text('ID:${user.facultyId}',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(
                        child: Text('Sitting Number:${user.groupId}',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                  ]),
              Divider(thickness: 3),
              Row(
                  children: [
                    Expanded(
                        child: Text('Subject',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text('Date',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text('Time',
                            style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.bold,
                            ))),
                  ]),
              Divider(
                thickness: 3,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount:user.exam.length,
                    itemBuilder: (BuildContext context,i ) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(child: Text(user.exam[i].subjectId)),
                                Expanded(child: Text(user.exam[i].examDate.toString())),
                                Container(
                                  height: 35,
                                  child: Column(
                                    children: [
                                      Expanded(child: Text(user.exam[i].start)),
                                      Expanded(child: Text(user.exam[i].end)),
                                    ],
                                  ),
                                ),
                                // Expanded(child: Text()),
                                // Expanded(child: Text()),
                              ]),),
                      );
                    }),
              ),
            ])));
  }
}
