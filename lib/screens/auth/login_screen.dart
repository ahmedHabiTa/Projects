import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../../Animation/FadeAnimation.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/auth_background.jpg'),
            fit: BoxFit.cover,
          )),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  // FadeAnimation(
                  //   1,
                  //   CircleAvatar(
                  //     radius: 50.0,
                  //     backgroundImage: AssetImage('images/hend2.jpg'),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.3,
                    Text('كلية الهندسة جامعة المنصورة',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20.0,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.6,
                    Text('smart student system',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // FadeAnimation(
                  //   1.9,
                  //   Text(' We are Here For You 😊 ',
                  //       style: TextStyle(
                  //           fontSize: 15.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black,
                  //           fontFamily: 'Lobster')),
                  // ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    2.1,
                    Padding(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          hintText: 'ID',
                          fillColor: Colors.white38,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlue,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter your ID ' : null,
                        obscureText: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    2.3,
                    Padding(
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off),
                            hintText: 'password',
                            fillColor: Colors.white38,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(60),
                            )),
                        validator: (val) =>
                            val.length < 5 ? ' Enter a password   ' : null,
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  FadeAnimation(
                      2.6,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                            color: Colors.blue[100],
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(MyHome.routeName);
                            },
                            child: Text('Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Lobster',
                                  fontSize: 20.0,
                                ))),
                      )),
                ]),
          ),
        ),
      ],
    ));
  }
}
