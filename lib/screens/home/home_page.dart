import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import 'results.dart';
import '../subject_profile/subjects_screen.dart';
import '../../widgets/main_drawer.dart';

class MyHome extends StatelessWidget {
  static const routeName = 'My_home';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    var deviceHeight = MediaQuery.of(context).size.height;
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
        padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.15),
        crossAxisCount: 2,
        children: <Widget>[
          _buildHomeCard(
            'All Subjects',
            () {
              Navigator.of(context).pushNamed(AllSubject.routeName);
            },
          ),
          _buildHomeCard(
            'Online Session',
            () {
              Navigator.pushNamed(context, '/online');
            },
          ),
          _buildHomeCard(
            'Exams',
            () {
              Navigator.pushNamed(context, '/Exams Tables');
            },
          ),
          _buildHomeCard(
            'Final Results',
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ResultsScreen(
                            table: user.table,
                          )));
            },
          )
        ],
      ),
    );
  }

  Widget _buildHomeCard(String title, Function function) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 9.0,
        color: Colors.white54,
        margin: EdgeInsets.all(15.0),
        child: InkWell(
            onTap: function,
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
                  Text(title,
                      style:
                          new TextStyle(fontSize: 20.0, fontFamily: 'Satisfy')),
                ])));
  }
}
