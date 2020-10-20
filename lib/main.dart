import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';
import 'screens/home_page.dart';
import 'screens/subjects_screen.dart';
// import 'screens/screen_select.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenID = 0; //0 for main, 1 for subjects
    return Scaffold(
      backgroundColor: appBodyColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('FLASHi'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      ),
      body: SubjectScreen(),
      drawer: myDrawer,
    );
  }
}
