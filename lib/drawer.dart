import 'package:flutter/material.dart';
import 'settings.dart';

Widget myDrawer = Drawer(
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [appButtonColor, Colors.blueGrey[900]], //Colors.grey[800]],
      ),
    ),
    child: SafeArea(
      child: Column(
        children: [
          Container(height: 50),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  hoverColor: Colors.grey.withAlpha(25),
                  leading:
                      Icon(Icons.notifications_active, color: Colors.white),
                  title: Text(
                    'REMINDERS',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 60,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.pie_chart, color: Colors.white),
                  title: Text(
                    'STATS',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  indent: 40,
                  endIndent: 40,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    'SETTINGS',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 60,
                  color: Colors.white,
                ),
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
