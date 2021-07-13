import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/model/subjects.dart';
import 'package:triple_s_project/providers/allSubjects.dart';
import 'package:triple_s_project/screens/subject_profile/details/quiz/res_dialog.dart';
import '../../../../model/subjectById.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  final int quizId;
  const QuizScreen({Key key, this.quiz, this.quizId}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState(quiz, quizId);
}

class _QuizScreenState extends State<QuizScreen> {
  final Quiz quiz;
  final int quizId;
  int total;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
  _QuizScreenState(this.quiz, this.quizId);

  void onEnd() {
    final res =
        Provider.of<SubjectsProvider>(context, listen: false).quizCalc(quizId);
    Navigator.of(context).pop(context);
    showDialog(
        context: context, builder: (ctx) => ResDialog(res: 0, total: total));
  }

  @override
  void initState() {
    super.initState();
    Provider.of<SubjectsProvider>(context, listen: false).attemptQuiz(quizId);
    total = Provider.of<SubjectsProvider>(context, listen: false)
        .quizCalcTotal(quizId);
  }

  @override
  Widget build(BuildContext context) {
    bool allSelected = Provider.of<SubjectsProvider>(context).allSelected;
    return Scaffold(
        appBar: AppBar(
          title: Text(quiz.name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Please Answer All Questions",
                  style: Theme.of(context).textTheme.headline6,
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Don't leave this page befor ending the quiz",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Quiz Degree : $total"),
                      CountdownTimer(
                        onEnd: onEnd,
                        endTime: endTime,
                      ),
                    ])),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: quiz.questions
                            .map((e) => QuestionWidget(
                                quiezId: quizId,
                                q: e,
                                qNum:
                                    (quiz.questions.indexOf(e) + 1).toString()))
                            .toList()))),
            Container(
                width: double.infinity,
                height: 75,
                color: allSelected ? Colors.blueAccent : Colors.grey,
                child: FlatButton(
                  child: Text(allSelected ? "Submit" : "Answer All Questions",
                      style: Theme.of(context).textTheme.bodyText2),
                  onPressed: allSelected
                      ? () {
                          final res = Provider.of<SubjectsProvider>(context,
                                  listen: false)
                              .quizCalc(quizId);
                          Navigator.of(context).pop(context);
                          showDialog(
                              context: context,
                              builder: (ctx) =>
                                  ResDialog(res: res[0], total: res[1]));
                        }
                      : () {},
                ))
          ],
        ));
  }
}

class QuestionWidget extends StatefulWidget {
  final int quiezId;
  final Question q;
  final String qNum;
  const QuestionWidget({Key key, this.q, this.qNum, this.quiezId})
      : super(key: key);
  @override
  _QuestionWidgetState createState() => _QuestionWidgetState(q);
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final Question q;
  String selectedAnswer = '';
  _QuestionWidgetState(this.q);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Text(widget.qNum + ' . ' + q.ques),
        ),
        Column(
            children: q.choisesList
                .map((e) => GestureDetector(
                    onTap: () {
                      int i = q.choisesList.indexOf(e);
                      setState(() {
                        if (selectedAnswer == i.toString()) {
                          selectedAnswer = '';
                          Provider.of<SubjectsProvider>(context, listen: false)
                              .quizAnswerRemoving((i + 1).toString(),
                                  int.parse(widget.qNum) - 1, widget.quiezId);
                        } else {
                          selectedAnswer = i.toString();
                          Provider.of<SubjectsProvider>(context, listen: false)
                              .quizAnswerSaving(
                            (i + 1).toString(),
                            int.parse(widget.qNum) - 1,
                            widget.quiezId,
                          );
                        }
                      });
                    },
                    child: AnswerWidget(
                      answer: e,
                      isSelected:
                          selectedAnswer != q.choisesList.indexOf(e).toString(),
                      number: (q.choisesList.indexOf(e) + 1).toString(),
                    )))
                .toList()),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}

class AnswerWidget extends StatefulWidget {
  final String answer;
  final String number;
  final bool isSelected;

  const AnswerWidget({Key key, this.answer, this.isSelected, this.number})
      : super(key: key);
  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSelected)
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 6.0,
              color: Colors.white,
              margin: EdgeInsets.all(15.0),
              child: ListTile(
                  leading: CircleAvatar(
                      child: Text(widget.number),
                      backgroundColor: Colors.blueAccent),
                  title: Text(
                    widget.answer,
                    style: TextStyle(color: Colors.black),
                  ))));
    else
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 6.0,
              color: Colors.blueAccent,
              margin: EdgeInsets.all(15.0),
              child: ListTile(
                  leading: SizedBox(),
                  trailing: CircleAvatar(
                      child: Icon(Icons.cancel_outlined,
                          size: 30, color: Colors.blueAccent),
                      backgroundColor: Colors.white),
                  title: Text(
                    widget.answer,
                    style: TextStyle(color: Colors.white),
                  ))));
  }
}
