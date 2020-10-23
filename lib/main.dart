import 'package:class_cards/screens/study_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/subjects_screen.dart';
import 'package:class_cards/screens/topic_screen.dart';

void main() {
  runApp(Nav());
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => HomeScreen(),
      '/subjects': (context) => SubjectScreen(),
      '/topic': (context) => TopicScreen(),
      '/study': (context) => StudyScreen(),
    });
  }
}
