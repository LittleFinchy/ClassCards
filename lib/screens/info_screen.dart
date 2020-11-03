import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody:  Container(
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            //SizedBox(height: 20,),
            Container(child: Text('How To Use Flashi:', style: TextStyle(color: Colors.white, fontSize: 30),)),
            //SizedBox(height: 20,),
            Column(
              children: [
                Text('1. Simply tap on ‘Study’ and choose your subject and topic.', style: TextStyle(color: Colors.white, fontSize: 20),),
                Text('(e.g. Study-->Science-->Biology…)',style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            //SizedBox(height: 20,),
            Text('2. Enjoy an easy to use scroll wheel with all the pre made Flashi flashcards in that topic', style: TextStyle(color: Colors.white, fontSize: 20),),
            //SizedBox(height: 20,),
            Text('3. You can also create your own custom flashcards by tapping on ‘Create’ from the homescreen', style: TextStyle(color: Colors.white, fontSize: 20),),
            //SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}
