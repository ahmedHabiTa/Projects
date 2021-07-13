// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthResponse welcomeFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String welcomeToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    @required this.status,
    @required this.message,
    @required this.user,
  });

  final String status;
  final String message;
  final User user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        user: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": user == null ? null : user.toJson(),
      };
}

class User {
  User({
    @required this.id,
    @required this.timestamps,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.img,
    @required this.nationalId,
    @required this.facultyId,
    @required this.department,
    @required this.grade,
    @required this.groupId,
    @required this.gender,
    @required this.birthDate,
    @required this.religion,
    @required this.nationality,
    @required this.birthPlace,
    @required this.acceptanceYear,
    @required this.city,
    @required this.address,
    @required this.mobile,
    @required this.homeTelephone,
    @required this.degree,
    @required this.preQualification,
    @required this.percentage,
    @required this.token,
    @required this.fcmToken,
    @required this.table,
    @required this.exam,
  });

  final String id;
  final DateTime timestamps;
  final String name;
  final String email;
  final String password;
  final String img;
  final String nationalId;
  final String facultyId;
  final String department;
  final String grade;
  final String groupId;
  final String gender;
  final DateTime birthDate;
  final String religion;
  final String nationality;
  final String birthPlace;
  final String acceptanceYear;
  final String city;
  final String address;
  final String mobile;
  final String homeTelephone;
  final String degree;
  final String preQualification;
  final String percentage;
  final String token;
  final String fcmToken;
  final List<Table> table;
  final List<Exam> exam;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        timestamps: json["timestamps"] == null
            ? null
            : DateTime.parse(json["timestamps"]),
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        img: json["img"] == null ? null : json["img"],
        nationalId: json["national_id"] == null ? null : json["national_id"],
        facultyId: json["faculty_id"] == null ? null : json["faculty_id"],
        department: json["department"] == null ? null : json["department"],
        grade: json["grade"] == null ? null : json["grade"],
        groupId: json["group_id"] == null ? null : json["group_id"],
        gender: json["gender"] == null ? null : json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        religion: json["religion"] == null ? null : json["religion"],
        nationality: json["nationality"] == null ? null : json["nationality"],
        birthPlace: json["birth_place"] == null ? null : json["birth_place"],
        acceptanceYear:
            json["acceptance_year"] == null ? null : json["acceptance_year"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        homeTelephone:
            json["home_telephone"] == null ? null : json["home_telephone"],
        degree: json["degree"] == null ? null : json["degree"],
        preQualification: json["pre_qualification"] == null
            ? null
            : json["pre_qualification"],
        percentage: json["percentage"] == null ? null : json["percentage"],
        token: json["token"] == null ? null : json["token"],
        fcmToken: json["FCM_token"] == null ? null : json["FCM_token"],
        table: json["table"] == null
            ? null
            : List<Table>.from(json["table"].map((x) => Table.fromJson(x))),
        exam: json["exam"] == null
            ? null
            : List<Exam>.from(json["exam"].map((x) => Exam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "timestamps": timestamps == null ? null : timestamps.toIso8601String(),
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "img": img == null ? null : img,
        "national_id": nationalId == null ? null : nationalId,
        "faculty_id": facultyId == null ? null : facultyId,
        "department": department == null ? null : department,
        "grade": grade == null ? null : grade,
        "group_id": groupId == null ? null : groupId,
        "gender": gender == null ? null : gender,
        "birth_date": birthDate == null
            ? null
            : "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "religion": religion == null ? null : religion,
        "nationality": nationality == null ? null : nationality,
        "birth_place": birthPlace == null ? null : birthPlace,
        "acceptance_year": acceptanceYear == null ? null : acceptanceYear,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "mobile": mobile == null ? null : mobile,
        "home_telephone": homeTelephone == null ? null : homeTelephone,
        "degree": degree == null ? null : degree,
        "pre_qualification": preQualification == null ? null : preQualification,
        "percentage": percentage == null ? null : percentage,
        "token": token == null ? null : token,
        "FCM_token": fcmToken == null ? null : fcmToken,
        "table": table == null
            ? null
            : List<dynamic>.from(table.map((x) => x.toJson())),
        "exam": exam == null
            ? null
            : List<dynamic>.from(exam.map((x) => x.toJson())),
      };
}

class Exam {
  Exam({
    @required this.id,
    @required this.timestamps,
    @required this.examDate,
    @required this.start,
    @required this.end,
    @required this.subjectId,
    @required this.departmentId,
    @required this.gradeId,
  });

  final String id;
  final DateTime timestamps;
  final DateTime examDate;
  final String start;
  final String end;
  final String subjectId;
  final String departmentId;
  final String gradeId;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"] == null ? null : json["id"],
        timestamps: json["timestamps"] == null
            ? null
            : DateTime.parse(json["timestamps"]),
        examDate: json["exam_date"] == null
            ? null
            : DateTime.parse(json["exam_date"]),
        start: json["start"] == null ? null : json["start"],
        end: json["end"] == null ? null : json["end"],
        subjectId: json["subject_id "] == null ? null : json["subject_id "],
        departmentId:
            json["department_id "] == null ? null : json["department_id "],
        gradeId: json["grade_id"] == null ? null : json["grade_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "timestamps": timestamps == null ? null : timestamps.toIso8601String(),
        "exam_date": examDate == null
            ? null
            : "${examDate.year.toString().padLeft(4, '0')}-${examDate.month.toString().padLeft(2, '0')}-${examDate.day.toString().padLeft(2, '0')}",
        "start": start == null ? null : start,
        "end": end == null ? null : end,
        "subject_id ": subjectId == null ? null : subjectId,
        "department_id ": departmentId == null ? null : departmentId,
        "grade_id": gradeId == null ? null : gradeId,
      };
}

class Table {
  Table({
    @required this.id,
    @required this.dayId,
    @required this.subjects,
  });

  final String id;
  final String dayId;
  final List<TableSubject> subjects;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"] == null ? null : json["id"],
        dayId: json["day_id"] == null ? null : json["day_id"],
        subjects: json["subjects"] == null
            ? null
            : List<TableSubject>.from(
                json["subjects"].map((x) => TableSubject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "day_id": dayId == null ? null : dayId,
        "subjects": subjects == null
            ? null
            : List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class TableSubject {
  TableSubject({
    @required this.subject,
    @required this.professor,
    @required this.department,
    @required this.online,
    @required this.place,
    @required this.lecTime,
  });

  final String subject;
  final String professor;
  final String department;
  final String online;
  final String place;
  final String lecTime;

  factory TableSubject.fromJson(Map<String, dynamic> json) => TableSubject(
        subject: json["subject"] == null ? null : json["subject"],
        professor: json["professor"] == null ? null : json["professor"],
        department: json["department"] == null ? null : json["department"],
        online: json["online"] == null ? null : json["online"],
        place: json["place"] == null ? null : json["place"],
        lecTime: json["lec_time"] == null ? null : json["lec_time"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject == null ? null : subject,
        "professor": professor == null ? null : professor,
        "department": department == null ? null : department,
        "online": online == null ? null : online,
        "place": place == null ? null : place,
        "lec_time": lecTime == null ? null : lecTime,
      };
}
