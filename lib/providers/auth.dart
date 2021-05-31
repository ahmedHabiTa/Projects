import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triple_s_project/helprs/constant.dart';
import 'package:triple_s_project/helprs/end_points.dart';
import 'package:triple_s_project/model/user.dart';

class Auth extends ChangeNotifier {
  final _helper = Constant.helper;
  LogInResponse _logInResponse;
  User _user;
  User get user {
    return _user;
  }

  Future<bool> login({@required String fId, @required String nId}) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await _helper.post(LOGINURL,
          {"national_id": nId, "faculty_id": fId, "FCM_token": "1234242456"});
      _logInResponse = LogInResponse.fromJson(response);
      if (_logInResponse.status == PASS) {
        _user = _logInResponse.user;
        sharedPreferences.setString(USERSHAERED, json.encode(_user.toJson()));
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
