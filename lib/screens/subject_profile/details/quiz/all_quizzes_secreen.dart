import 'package:flutter/material.dart';
import 'package:triple_s_project/screens/subject_profile/details/quiz/quiz_screen.dart';

class ALLQuizzesScreen extends StatefulWidget {
  static const routeName = 'quizzes';
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<ALLQuizzesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Quizzes',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      )),
      body: Column(
        children: [
          ListTile(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => QuizScreen())),
            leading: Icon(Icons.question_answer),
            title: Text("quiz 1"),
          )
        ],
      ),
    );
  }
}
