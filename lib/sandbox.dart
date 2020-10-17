import 'package:flutter/material.dart';
import 'settings.dart';

Widget myDrawer = Drawer(
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [appButtonColor, Colors.grey[800]],
      ),
    ),
    child: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.notifications_active),
                  title:
                      Text('Reminders', style: TextStyle(color: Colors.white)),
                ),
                Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 100,
                    color: Colors.white),
                ListTile(
                  leading: Icon(Icons.pie_chart),
                  title:
                      Text('Reminders', style: TextStyle(color: Colors.white)),
                ),
                Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 100,
                    color: Colors.white),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 100,
                    color: Colors.white),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.settings), title: Text('Facebook')),
                  ListTile(leading: Icon(Icons.help), title: Text('Instagram'))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
