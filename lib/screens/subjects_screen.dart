import 'package:flutter/material.dart';
import 'package:triple_s_project/screens/subject_detail_screen.dart';
import 'package:triple_s_project/widgets/main_drawer.dart';
class AllSubject extends StatelessWidget {
  static const routeName = 'all_subjects';
  final String subjectID ;

  const AllSubject({this.subjectID}) ;

  @override
  Widget build(BuildContext context) {
    
    //This List For Example
    List<String> subjects = ['ahmed','c2','hend','alaa','hafez'];
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Subjects',style: Theme.of(context).textTheme.headline6,),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (ctx,index){
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 6.0,
              color: Colors.white54,
              margin: EdgeInsets.all(15.0),
              child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(SubjectDetailScreen.routeName,arguments: subjectID);
                  },
                leading:  Text(subjects[index],textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 20.0, fontFamily: 'Satisfy')),
                      ),
              );
        },
      ),
    );
  }
}
