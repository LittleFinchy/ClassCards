import 'package:flutter/material.dart';
import '../drawer.dart';
import '../settings.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      // body:       
      drawer: myDrawer,
    );
  }
}
