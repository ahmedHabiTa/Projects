class LogInResponse {
  String status;
  String message;
  User user;

  LogInResponse({this.status, this.message, this.user});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['data'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String id;
  String timestamps;
  String name;
  String email;
  String password;
  String nationalId;
  String facultyId;
  String department;
  String grade;
  String groupId;
  String token;
  String fCMToken;
  List<Table> table;

  User(
      {this.id,
      this.timestamps,
      this.name,
      this.email,
      this.password,
      this.nationalId,
      this.facultyId,
      this.department,
      this.grade,
      this.groupId,
      this.token,
      this.fCMToken,
      this.table});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamps = json['timestamps'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    nationalId = json['national_id'];
    facultyId = json['faculty_id'];
    department = json['department'];
    grade = json['grade'];
    groupId = json['group_id'];
    token = json['token'];
    fCMToken = json['FCM_token'];
    if (json['table'] != null) {
      table = new List<Table>();
      json['table'].forEach((v) {
        table.add(new Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamps'] = this.timestamps;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['national_id'] = this.nationalId;
    data['faculty_id'] = this.facultyId;
    data['department'] = this.department;
    data['grade'] = this.grade;
    data['group_id'] = this.groupId;
    data['token'] = this.token;
    data['FCM_token'] = this.fCMToken;
    if (this.table != null) {
      data['table'] = this.table.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  String id;
  String timestamps;
  String subjectId;
  String dayId;
  String professorId;
  String departmentId;
  String onlineId;
  String placeId;
  String lecTimeId;

  Table(
      {this.id,
      this.timestamps,
      this.subjectId,
      this.dayId,
      this.professorId,
      this.departmentId,
      this.onlineId,
      this.placeId,
      this.lecTimeId});

  Table.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamps = json['timestamps'];
    subjectId = json['subject_id'];
    dayId = json['day_id'];
    professorId = json['professor_id'];
    departmentId = json['department_id'];
    onlineId = json['online_id'];
    placeId = json['place_id'];
    lecTimeId = json['lec_time_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamps'] = this.timestamps;
    data['subject_id'] = this.subjectId;
    data['day_id'] = this.dayId;
    data['professor_id'] = this.professorId;
    data['department_id'] = this.departmentId;
    data['online_id'] = this.onlineId;
    data['place_id'] = this.placeId;
    data['lec_time_id'] = this.lecTimeId;
    return data;
  }
}
