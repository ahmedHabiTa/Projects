import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:triple_s_project/providers/theme_provider.dart';
import 'package:triple_s_project/screens/subject_profile/subjects_screen.dart';
import '../providers/auth.dart';
import '../screens/home/home_page.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    var themeMode = Provider.of<ThemeProvider>(context).tm;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: 250,
              // padding: EdgeInsets.all(8),
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                    CircleAvatar(
                      radius: 35,

                      child: ClipOval(
                        child: Image.asset(
                          'images/center_logo.jpg',

                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: CircleAvatar(
                  //     radius: 40,
                  //     backgroundImage: NetworkImage(user.image ?? ''),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   user.name,
                  //   style: TextStyle(
                  //     color: Colors.blue[400],
                  //     fontWeight: FontWeight.w500,
                  //     height: 0.2,),
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(
                    height: 10,),
                  Text(
                    user.department,
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w400,
                      height: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   user.grade,
                  //   style: TextStyle(
                  //     color: Colors.blue[400],
                  //     fontWeight: FontWeight.w300,
                  //     height: 0.2,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(
                    height: 3,
                  ),
                  customDrawerItem(themeMode, context, () {
                    Navigator.of(context)
                        .pushReplacementNamed(MyHome.routeName);
                  }, Icons.home, 'Home'),
                  customDrawerItem(themeMode, context, () {
                    Navigator.pushNamed(context, '/std');
                  }, Icons.person, 'Student Info'),
                  customDrawerItem(themeMode, context, () {
                    Navigator.pushNamed(context, '/results');

                  }, Icons.table_view,
                      'Study Timetable'),
                  customDrawerItem(themeMode, context, () {}, Icons.description,
                      'Academic Results'),
                  customDrawerItem(themeMode, context, () {
                    Navigator.of(context).pushNamed(AllSubject.routeName);
                  },
                      Icons.menu_book_sharp, 'Courses'),
                  customDrawerItem(themeMode, context, () {
                    Navigator.pushNamed(context, '/notification');

                  },
                      Icons.notification_important_outlined, 'Notification'),
                  customDrawerItem(themeMode, context, () {
                    Navigator.pushNamed(context, '/settings');
                  }, Icons.settings, 'Settings'),
                  customDrawerItem(themeMode, context, () async {
                    await Provider.of<Auth>(context, listen: false).logout();
                  }, Icons.logout, 'Log out'),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY(
                      (pi / 3 * val),
                    ),
                  child: MyHome(),
                ));}),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          ),],),);
  }

  Widget customDrawerItem(
    ThemeMode themeMode,
    context,
    Function navigateTo,
    IconData icon,
    String text,
  ) {
    return Card(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blue[200],
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: Icon(icon, size: 30, color: Colors.blue[500]),
            title: Text(
              text,
              style: TextStyle(color: Colors.black87),
            ),
            onTap: navigateTo,
          ),
        ),
      ),
    );}
}
