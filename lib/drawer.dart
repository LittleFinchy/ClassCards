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
                    color: Colors.white),
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
                    color: Colors.white),
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

// Widget myDrawer = Drawer(
//   child: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [appButtonColor, Colors.grey[800]],
//       ),
//     ),
//     child: SafeArea(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           ListTile(
//             leading: Icon(Icons.notifications_active, color: Colors.white),
//             title: Text(
//               'REMINDERS',
//               style: TextStyle(color: Colors.white, fontSize: 22),
//             ),
//           ),
//           Divider(
//               thickness: 1, indent: 20, endIndent: 100, color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.pie_chart, color: Colors.white),
//             title: Text(
//               'STATS',
//               style: TextStyle(color: Colors.white, fontSize: 22),
//             ),
//           ),
//           Divider(
//               thickness: 1, indent: 20, endIndent: 100, color: Colors.white),
//           ListTile(
//             leading: Icon(Icons.settings, color: Colors.white),
//             title: Text(
//               'SETTINGS',
//               style: TextStyle(color: Colors.white, fontSize: 22),
//             ),
//           ),
//           Divider(
//               thickness: 1, indent: 20, endIndent: 100, color: Colors.white),
//           Expanded(child: Container()),
//           Container(
//             child: Align(
//               alignment: FractionalOffset.bottomCenter,
//               child: Column(
//                 children: <Widget>[
//                   Divider(),
//                   ListTile(
//                       leading: Icon(Icons.settings), title: Text('Facebook')),
//                   ListTile(leading: Icon(Icons.help), title: Text('Instagram'))
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
