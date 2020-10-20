import 'package:flutter/material.dart';
import 'settings.dart';
import 'drawer.dart';
import 'screens/home_screen.dart';
import 'screens/subjects_screen.dart';
import 'screens/topic_screen.dart';

void main() {
  runApp(Nav());
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => HomeScreen(),
      '/subjects': (context) => SubjectScreen(),
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
