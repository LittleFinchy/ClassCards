import 'package:flutter/material.dart';

Widget myDrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: const <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child: Text('Drawer Header',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text('Messages'),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Profile'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ],
  ),
);
