import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:flutter/material.dart';
import '../settings.dart';
import '../widgets/dataTypes.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[800],
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: -15,
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'THEME',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    TextButton(
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: appBodyColorO,
                        ),
                        title: Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
                            'Orange',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            Settings.of(context).setTheme(0);
                          },
                        );
                        scaffoldKey.currentState.showSnackBar(soonSnack);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: appBodyColorP,
                        ),
                        title: Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
                            'Purple',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            Settings.of(context).setTheme(1);
                          },
                        );
                        scaffoldKey.currentState.showSnackBar(soonSnack);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: appBodyColorB,
                        ),
                        title: Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
                            'Blue',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            Settings.of(context).setTheme(2);
                          },
                        );
                        scaffoldKey.currentState.showSnackBar(soonSnack);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    TextButton(
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: appBodyColorR,
                        ),
                        title: Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text(
                            'Red',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            Settings.of(context).setTheme(3);
                          },
                        );
                        scaffoldKey.currentState.showSnackBar(soonSnack);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    SizedBox(height: 40),
                    Divider(
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'DATA',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Clear all local data',
                        style:
                            TextStyle(color: Color(0x7FFFFFFF), fontSize: 16),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
