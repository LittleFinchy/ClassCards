import 'package:class_cards/screens/study_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/subjects_screen.dart';

void main() {
  runApp(Nav());
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => HomeScreen(), // Was HomeScreen() ...... im just testing this study screen
      '/subjects': (context) => SubjectScreen(),
      '/study': (context) => StudyScreen(),
    });
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: appBodyColor,
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         title: Text('FLASHi'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               icon: Icon(
//                 Icons.info_outline,
//                 color: Colors.white,
//               ),
//               onPressed: () {})
//         ],
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
//       ),
//       body: HomeScreen(),
//       drawer: myDrawer,
//     );
//   }
// }
