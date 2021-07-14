import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/providers/auth.dart';

class StudentInfo extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile details',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      offset: Offset(0, 3))
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(children: [
                SizedBox(
                  child: Text(
                    " Mansoura University",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(color: Colors.grey),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: Image.network(
                            user.img,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        // child: Icon(
                        //   Icons.add_a_photo,
                        //   color: Colors.white,
                        //   ),
                        //decoration: BoxDecoration(
                        //    color: Colors.deepOrange,
                        //    borderRadius:
                        //         BorderRadius.all(Radius.circular(20))),
                      ),
                      Column(children: [
                        Container(
                            child: Column(children: [
                          Text('${user.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.white)),
                        ])),
                        SizedBox(height: 10),
                        Container(
                            child: Column(children: [
                          Text('Faculty Of Engineering',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.white, fontSize: 14)),
                        ]))
                      ]),
                    ]),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('gender : ${user.gender}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Text('grade : ${user.grade}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Text('department : ${user.department}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                      ],
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.email, color: Colors.blueGrey),
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Text('Email : ${user.email}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                ]),
                Divider(color: Colors.grey),
                SizedBox(
                  height: 10,
                ),
              ])),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 4),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text('Student Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Name : ${user.name}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'email : ${user.email}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Nationality Number : ${user.nationalId}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Mobile : ${user.mobile}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Birth place : ${user.birthPlace}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                      Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Nationality : ${user.nationality}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.white70)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
