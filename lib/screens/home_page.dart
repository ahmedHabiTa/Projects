import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:triple_s_project/screens/subjects_screen.dart';
import 'package:triple_s_project/widgets/main_drawer.dart';


class MyHome extends StatelessWidget {
  static const routeName = 'My_home' ;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Smart Student System',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        elevation: 30,
        iconTheme: IconThemeData.fallback(),
        bottomOpacity: 10.0,
      ),
      drawer: MainDrawer(),
      body: GridView.count(
            padding:  EdgeInsets.symmetric(vertical: deviceHeight*0.15),
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
                  elevation: 6.0,
                  color: Colors.white54,
                  margin: EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(AllSubject.routeName);
                      },
                      splashColor: Colors.blue[50],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.import_contacts_sharp,
                              color: Colors.lightBlue[800],
                              size: 57,
                            ),
                            Text('All Subjects',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 20.0, fontFamily: 'Satisfy')),
                          ]))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 6.0,
                  color: Colors.white54,
                  margin: EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/online');
                      },
                      splashColor: Colors.blue[50],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.laptop_chromebook,
                              color: Colors.lightBlue[800],
                              size: 55,
                            ),
                            Text(
                                'Online'
                                    ' Session',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 20.0, fontFamily: 'Satisfy')),
                          ]))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 9.0,

                  color: Colors.white54,
                  margin: EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Exams '
                            'Tables');
                      },
                      splashColor: Colors.blue[50],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.table_view_sharp,
                              color: Colors.lightBlue[800],
                              size: 55,
                            ),
                            Text(
                                'Exams',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontSize: 20.0, fontFamily: 'Satisfy')),
                          ]))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 9.0,
                  color: Colors.white54,
                  margin: EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/results');
                      },
                      splashColor: Colors.blue[50],
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.text_snippet,
                              color: Colors.lightBlue[800],
                              size: 55,
                            ),
                            Text('Final Results',
                                style: new TextStyle(
                                    fontSize: 20.0, fontFamily: 'Satisfy')),
                          ]))),
            ],
          ),


    );
  }
}
