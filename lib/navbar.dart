import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/images/cover.jpg'))
              ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.input),
          //   title: Text('Welcome'),
          //   onTap: () => {},
          // ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.of(context).pop(),
             Navigator.pushNamed(context, '/home')
             },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Post A Question'),
            onTap: () => {
              Navigator.of(context).pop(),
             Navigator.pushNamed(context, '/newquestion')
             },
          ),
          ListTile(
            leading: Icon(Icons.question_mark_rounded),
            title: Text('My Questions'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_rounded),
            title: Text('Profile'),
            onTap: () => {
                            Navigator.of(context).pop(),
                            Navigator.pushNamed(context, '/profile')
                          },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.popUntil(context, (route) => false),
              Navigator.pushNamed(context, '/')
            },
          ),
        ],
      ),
    );
  }
}