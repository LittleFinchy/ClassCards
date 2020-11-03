import 'package:flutter/material.dart';
import 'settings.dart';
import 'widgets/dataTypes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Settings.of(context).appButtonColor, Colors.grey[800]],
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
                            .pushNamedAndRemoveUntil('/', (route) => false);
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
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(soonSnack);
                      },
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
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(soonSnack);
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
                        leading: Icon(Icons.settings, color: Colors.white),
                        title: Text(
                          'SETTINGS',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
                    children: [
                      Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Flashi', style: TextStyle(fontSize: 32, color: Colors.white, fontStyle: FontStyle.italic)),
                              SizedBox(height: 8,),
                              Text('A study app..\n..with flashcards!', style: TextStyle(fontSize: 16, color: Colors.white)),
                            ],
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/flashi_logo.png'))))
                          ],),
                      
                      Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                      SizedBox(height: 20),
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



// Container(
//       width: 280,
//       height: 340,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.white,
//           width: 3,
//         ),
//         borderRadius: BorderRadius.circular(30),
//         image: DecorationImage(
//           image: Settings.of(context).appCardBackground,
//           fit: BoxFit.fill,
//         ),