
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triple_s_project/providers/theme_provider.dart';
import 'package:triple_s_project/screens/banks.dart';
import 'package:triple_s_project/screens/reports.dart';
import 'package:triple_s_project/screens/exams.dart';
import 'package:triple_s_project/screens/examsschedule.dart';
import 'package:triple_s_project/screens/home_page.dart';
import 'package:triple_s_project/screens/login_screen.dart';
import 'package:triple_s_project/screens/online.dart';
import 'package:triple_s_project/screens/quiz.dart';
import 'package:triple_s_project/screens/results.dart';
import 'package:triple_s_project/screens/studen_info_screen.dart';
import 'package:triple_s_project/screens/subject_detail_screen.dart';
import 'package:triple_s_project/screens/subjects_screen.dart';
import 'package:triple_s_project/screens/theme_settings.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/widgets/main_splash_scrseen.dart';

void main() async {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context)=> ThemeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: tm,
        theme: ThemeData(
            cardColor: Colors.black87,
            buttonColor: Colors.black87,
            primarySwatch: primaryColor,
            accentColor: accentColor,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              headline6: TextStyle(
                  color: Colors.black87,
                  fontSize: 19,
                  fontFamily: 'Satisfy',
                  fontWeight: FontWeight.bold),
            )),
        darkTheme: ThemeData(
            unselectedWidgetColor: Colors.white70,
            cardColor: Colors.white,
            buttonColor: Colors.white,
            primarySwatch: primaryColor,
            accentColor: accentColor,
            canvasColor: Color.fromRGBO(14, 22, 33, 1),
            textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white),
              headline6: TextStyle(
                  color: Colors.white70,
                  fontSize: 19,
                  fontFamily: 'Satisfy',
                  fontWeight: FontWeight.bold),
            )),
        initialRoute: 'LoginScreen',

        routes: {
          'main_splash': (context) => MainSplashScreen(),
          'LoginScreen': (context) => LoginScreen(),
          MyHome.routeName :(context) => MyHome(),
          Reports.routeName: (context) => Reports(),
          '/online': (context) => OnLine(),
          '/exams': (context) => Exams(),
          Quizzes.routeName: (context) => Quizzes(),
          '/results': (context) => Results(),
          '/Exams Schedule': (context) => ExamsSchedule(),
          '/std': (context) => Student(),
          '/settings':(context) => ThemesScreen(),
          AllSubject.routeName : (context) => AllSubject(),
          SubjectDetailScreen.routeName :(context) => SubjectDetailScreen(),
          Banks.routeName :(context) => Banks(),
        });
  }
}

