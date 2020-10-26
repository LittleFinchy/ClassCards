import 'package:flutter/material.dart';
import '../settings.dart';
import '../drawer.dart';

class ScreenWrapper extends StatelessWidget {
  final Container newBody;
  ScreenWrapper({
    Key key,
    this.newBody,
  }) : super(key: key);
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
      body: newBody,
      drawer: MyDrawer(),
    );
  }
}





/// TEMPLATE NEW SCREEN ///

// import 'package:class_cards/widgets/screenConstructor.dart';
// import 'package:flutter/material.dart';

// class CreateScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenWrapper(
//       newBody: Container(
//       ),
//     );
//   }
// }