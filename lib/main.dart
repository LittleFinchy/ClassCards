import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

//leave app bar alone
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          title: Text("Milo's Project",
              style: TextStyle(color: Colors.white, fontSize: 24)),
          centerTitle: true,
          backgroundColor: barColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          actions: [
            IconButton(
              icon: Icon(Icons.flash_on, color: Colors.white),
            )
          ],
        ),
        drawer: drawer,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    //width: 100,
                    //height: 100,
                    //color: Colors.blue[100],
                    child: Center(
                        child: Ink(
                  decoration: const ShapeDecoration(
                      color: Colors.lightBlue, shape: CircleBorder()),
                  child: IconButton(
                    icon: Icon(Icons.android),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ))),
                Container(width: 100, height: 100, color: Colors.blue[800]),
                Container(width: 100, height: 100, color: Colors.blue[800]),
              ]),
        ));
  }
}
