import 'package:flutter/material.dart';
import 'settings.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    TextButton(
                      child: ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title: Text(
                          'HOME',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                      color: Colors.white,
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Icon(Icons.notifications_active,
                            color: Colors.white),
                        title: Text(
                          'REMINDERS',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 60,
                      color: Colors.white,
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Icon(Icons.pie_chart, color: Colors.white),
                        title: Text(
                          'STATS',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                      color: Colors.white,
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Icon(Icons.settings, color: Colors.white),
                        title: Text(
                          'SETTINGS',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/settings',
                        );
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
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
                          leading: Icon(Icons.settings),
                          title: Text('Facebook')),
                      ListTile(
                          leading: Icon(Icons.help), title: Text('Instagram'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
