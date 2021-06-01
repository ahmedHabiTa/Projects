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
            'Student information',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[300],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                ),
                margin: EdgeInsets.all(5),
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: Text('Personal Information',style: TextStyle(fontSize: 17,color: Colors.white),),
                ),
              ),
              SizedBox(height: 10,),
              studentInfoRow('Name', user.name),
              SizedBox(height: 8,),
              studentInfoRow('Email', user.email),
              SizedBox(height: 8,),
              studentInfoRow('National ID', user.nationalId),
              SizedBox(height: 8,),
              studentInfoRow('Faculty ID', user.facultyId),
              SizedBox(height: 8,),
              studentInfoRow('Department', user.department),
              SizedBox(height: 8,),
              studentInfoRow('Grade', user.grade),
            ],
          ),
        ),
      ),
    );
  }
  Widget studentInfoRow(String info,String studentInfo){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left : 35),
          child: Text(info,style: TextStyle(fontSize:17,color:Colors.black87 ),),
        ),
        SizedBox(width: 30,),
        Text(studentInfo,style: TextStyle(fontSize:17,color:Colors.white ),),

      ],
    );
  }
}
