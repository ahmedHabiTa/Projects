import 'package:flutter/material.dart';
import 'package:triple_s_project/screens/subject_detail_screen.dart';
import 'package:triple_s_project/widgets/main_drawer.dart';

class Subjects {
  int id;

  String name;

  Subjects({@required this.id, @required this.name});
}

class AllSubject extends StatelessWidget {
  static const routeName = 'all_subjects';

  @override
  Widget build(BuildContext context) {
    List<Subjects> subjects = [
      Subjects(id: 1, name: 'ahmed'),
      Subjects(id: 2, name: 'c2'),
      Subjects(id: 3, name: 'hend'),
    ];

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Subjects',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (ctx, index) {
          return Hero(
            tag: subjects[index].id,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 6.0,
              color: Colors.white54,
              margin: EdgeInsets.all(15.0),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(SubjectDetailScreen.routeName,
                      arguments: subjects[index].id);
                },
                leading: Text(subjects[index].name,
                    textAlign: TextAlign.center,
                    style:
                        new TextStyle(fontSize: 20.0, fontFamily: 'Satisfy')),
              ),
            ),
          );
        },
      ),
    );
  }
}
