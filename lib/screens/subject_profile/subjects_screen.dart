import 'package:flutter/material.dart';
import 'subject_detail_screen.dart';
import '../../widgets/main_drawer.dart';

class Subject {
  final int id;
  final String name;

  Subject({@required this.id, @required this.name});
}

class AllSubject extends StatelessWidget {
  static const routeName = 'all_subjects';

  @override
  Widget build(BuildContext context) {
    //This List For Example
    List<Subject> subjects = [
      Subject(id: 1, name: "hebita"),
      Subject(id: 2, name: "C2"),
      Subject(id: 3, name: "Hafez"),
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
        body: SingleChildScrollView(
          child: Column(
            children: subjects
                .map((e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      elevation: 6.0,
                      color: Colors.white54,
                      margin: EdgeInsets.all(15.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SubjectDetailScreen.routeName,
                              arguments: e);
                        },
                        leading: Image.asset("images/subject.png"),
                        title: Text(e.name,
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 20.0, fontFamily: 'Satisfy')),
                      ),
                    )))
                .toList(),
          ),
        ));
  }
}
//  ListView.builder(
//   itemCount: subjects.length,
//   itemBuilder: (ctx, index) {
//     return Card(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25.0)),
//       elevation: 6.0,
//       color: Colors.white54,
//       margin: EdgeInsets.all(15.0),
//       child: ListTile(
//         onTap: () {
//           Navigator.of(context).pushNamed(SubjectDetailScreen.routeName,
//               arguments: subjects[index].id);
//         },
//         leading: Text(subjects[index].name,
//             textAlign: TextAlign.center,
//             style: new TextStyle(fontSize: 20.0, fontFamily: 'Satisfy')),
//       ),
//     );
//   },
// ),
