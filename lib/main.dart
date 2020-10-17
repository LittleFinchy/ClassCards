import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';

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
    return Scaffold(
        backgroundColor: appBodyColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text('FLASHi'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    // borderRadius: BorderRadius.circular(40),
                    shape: BoxShape.circle,
                    color: appButtonColor,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(50, 0),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.border_color,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Create',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: myDrawer);
  }
}
