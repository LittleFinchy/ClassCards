import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';
import 'widgets/homePageButton.dart';
import 'screens/subjects_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: appBodyColor,
//         appBar: AppBar(
//           backgroundColor: appBarColor,
//           title: Text('FLASHi'),
//           centerTitle: true,
//           actions: [
//            IconButton(
//                 icon: Icon(
//                   Icons.info_outline,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {})
//           ],
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
//         ),
//         body: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildButton(
//                 text: 'Study',
//                 icon: Icon(
//                   Icons.edit,
//                   color: Colors.white,
//                   size: 50,
//                 ),
//               ),
//               buildButton(
//                 text: 'Create',
//                 icon: Icon(
//                   Icons.add_to_photos,
//                   color: Colors.white,
//                   size: 50,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         drawer: myDrawer,
//      );
//   }
// }

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
