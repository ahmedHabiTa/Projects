class SubjectsResponse {
  String status;
  String message;
  List<Subject> subject;

  SubjectsResponse({this.status, this.message, this.subject});

  SubjectsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      subject = new List<Subject>();
      json['data'].forEach((v) {
        subject.add(new Subject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.subject != null) {
      data['data'] = this.subject.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subject {
  String id;
  String name;

  Subject({this.id, this.name});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
