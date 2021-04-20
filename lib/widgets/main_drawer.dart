
import 'package:flutter/material.dart';
import 'package:triple_s_project/screens/home_page.dart';
import 'package:triple_s_project/screens/login_screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.all(0.7),
            accountEmail: Text(
              'Student@std.mans.edu.eg',
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.black87),
            ),
            accountName: Text(
              'Student Name',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
                height: 0.2,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/hii.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.white60,
              backgroundBlendMode: BlendMode.softLight,
              shape: BoxShape.rectangle,
              // image: DecorationImage(
              //     image: AssetImage(
              //       'images/hend4.jpg',
              //     ),
              //     scale: 0.6,
              //     fit: BoxFit.contain,
              //     alignment: Alignment.topRight),
            ),
          ),
          Divider(
            height: 10,
            thickness: 4,
            color: Colors.blueGrey,
            indent: 32,
            endIndent: 32,
          ),
          ListTile(
            leading:
            Icon(Icons.person, size: 30, color: const Color(0xFF1565C0)),
            title: Text(
              'Student Info',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/std');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 30.0,
              color: const Color(0xFF1565C0),
            ),
            title: Text('Home Page'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(MyHome.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.table_view,
              size: 30.0,
              color: const Color(0xFF1565C0),
            ),
            title: Text('Table'),
          ),
          ListTile(
            leading: Icon(Icons.notification_important_outlined,
                size: 30, color: const Color(0xFF1565C0)),
            title: Text('Notification'),
          ),
          Divider(
            height: 10,
            thickness: 4,
            color: Colors.blueGrey,
            indent: 20,
            endIndent: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: const Color(0xFF1565C0),
            ),
            title: Text('Settings'),
            onTap: (){
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 30,
              color: const Color(0xFF1565C0),
            ),
            title: Text('Log out'),

          ),
        ],
      ),
    );
  }
}
