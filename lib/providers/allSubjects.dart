import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triple_s_project/helprs/constant.dart';
import 'package:triple_s_project/helprs/end_points.dart';
import 'package:triple_s_project/model/subjectById.dart';
import 'package:triple_s_project/model/subjects.dart';
import 'package:triple_s_project/model/user.dart';

class SubjectsProvider extends ChangeNotifier {
  final _helper = Constant.helper;
  SubjectsResponse subjectsResponse;
  List<Subject> _subjects = [];
  List<Subject> get subjects {
    return _subjects;
  }

  Future<void> getSubjects() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final user =
          User.fromJson(json.decode(sharedPreferences.get(USERSHAERED)));
      final response = await _helper.get(SUJECTS + user.token);
      subjectsResponse = SubjectsResponse.fromJson(response);
      _subjects = subjectsResponse.data;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  SubjectById _selectedSubjectByid;
  SubjectById get selectedSubjectByid {
    return _selectedSubjectByid;
  }

  Future<void> getSubjectById({String id}) async {
    try {
      _selectedSubjectByid = null;
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final user =
          User.fromJson(json.decode(sharedPreferences.get(USERSHAERED)));
      final response =
          await _helper.post(SUBJECTBYID + user.token, {"subject_id": id});
      SubjectByIdRes selectedSubjectByidResponse =
          SubjectByIdRes.fromJson(response);
      _selectedSubjectByid = selectedSubjectByidResponse.data;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
