import 'package:flutter/material.dart';
import 'package:triple_s_project/screens/subject_profile/subjects_screen.dart';

import '../../widgets/main_drawer.dart';
import 'details/bank/all_banks_screen.dart';
import 'details/quiz/all_quizzes_secreen.dart';
import 'details/report/reports.dart';

class SubjectDetailScreen extends StatefulWidget {
  static const routeName = 'subject_details_screen';

  @override
  _SubjectDetailScreenState createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final subject = ModalRoute.of(context).settings.arguments as Subject;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            subject.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCard("Quiz", "images/quiz.png", () {
              Navigator.of(context).pushNamed(
                ALLQuizzesScreen.routeName,
              );
            }),
            _buildCard("Reports", "images/report.png", () {
              Navigator.of(context).pushNamed(
                Reports.routeName,
              );
            }),
            _buildCard("Banks", "images/ask-question.png", () {
              Navigator.of(context).pushNamed(
                Banks.routeName,
              );
            }),
          ],
        )));
  }

  Widget _buildCard(String title, image, Function function) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 6.0,
          color: Colors.white54,
          margin: EdgeInsets.all(15.0),
          child: Center(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              onTap: function,
              leading: Image.asset(image),
              title: Text(title,
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 20.0, fontFamily: 'Satisfy')),
            ),
          ),
        ));
  }
}
