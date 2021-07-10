import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/Animation/FadeAnimation.dart';
import 'package:triple_s_project/providers/auth.dart';
import 'package:triple_s_project/providers/theme_provider.dart';
import 'package:triple_s_project/screens/home/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool loading = false;
  bool obscureText = false;
  String fId, nId;
  _login() async {
    if (!globalKey.currentState.validate()) {
      return;
    }

    setState(() {
      loading = true;
    });
    try {
      print(fId + nId);
      bool isAuth = await Provider.of<Auth>(context, listen: false)
          .login(fId: fId, nId: nId);
      print("111111111111");
      if (isAuth) {
        Navigator.pushReplacementNamed(context, MyHome.routeName);
      } else {
        //  TODO : Toast
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context).tm;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: globalKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1,
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Smart Student System',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 22.0,
                        )),
                  )),
              FadeAnimation(
                1.3,
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'images/login_image.jpg',
                      )),
                  height: 220,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              FadeAnimation(
                2.1,
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.purple[300],
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeMode == ThemeMode.dark
                            ? Theme.of(context).canvasColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person,
                                color: themeMode == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.purple[300]),
                            hintText: 'National ID ',
                            hintStyle: TextStyle(
                                color: themeMode == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.purple[400]),
                            focusColor: themeMode == ThemeMode.dark
                                ? Colors.white
                                : Colors.purple[300]
                            // fillColor: Colors.white38,
                            // filled: true,
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Colors.white,
                            //       width: 1.0,
                            //       style: BorderStyle.solid),
                            //   borderRadius: BorderRadius.circular(60),
                            // ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Colors.lightBlue,
                            //       width: 1.0,
                            //       style: BorderStyle.solid),
                            //   borderRadius: BorderRadius.circular(60),
                            // ),
                            ),
                        onChanged: (val) {
                          nId = val;
                        },
                        validator: (val) =>
                            val.isEmpty ? 'Enter your ID ' : null,
                        obscureText: false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeAnimation(
                2.3,
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.purple[300],
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeMode == ThemeMode.dark
                                ? Theme.of(context).canvasColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Faculty ID',
                              hintStyle: TextStyle(
                                  color: themeMode == ThemeMode.dark
                                      ? Colors.white
                                      : Colors.purple[300]),
                              prefixIcon: Icon(Icons.lock,
                                  color: themeMode == ThemeMode.dark
                                      ? Colors.white
                                      : Colors.purple[300]),
                              focusColor: themeMode == ThemeMode.dark
                                  ? Colors.white
                                  : Colors.purple[300],
                              //fillColor: Colors.white38,
                              //filled: true,
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.white,
                              //       width: 1.0,
                              //       style: BorderStyle.solid),
                              //   borderRadius: BorderRadius.circular(60),
                              // ),
                              // focusedBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors.lightBlue,
                              //       width: 1.0,
                              //       style: BorderStyle.solid),
                              //   borderRadius: BorderRadius.circular(60),
                              // ),
                            ),
                            onChanged: (val) {
                              fId = val;
                            },
                            validator: (val) =>
                                val.length < 5 ? ' Enter a password   ' : null,
                            obscureText: obscureText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.0),
              FadeAnimation(
                2.6,
                ElevatedButton(
                  child: Text('Login',
                      style: TextStyle(
                        color: themeMode == ThemeMode.dark
                            ? Colors.black87
                            : Colors.white,
                        fontFamily: 'Lobster',
                        fontSize: 24.0,
                      )),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[300]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.red))),
                  ),
                  onPressed: _login,
                ),
              )
              //  : CircularProgressIndicator(),
            ],
          ),
        ),
      )),
    ));
  }
}
