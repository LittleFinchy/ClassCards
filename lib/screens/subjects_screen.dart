import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/subjectTile.dart';
import '../widgets/dataTypes.dart';

class SubjectScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectTile(
                    subjectTitle: 'Math',
                    subjectIcon: Icons.calculate_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('Math'));
                    }),
                SubjectTile(
                    subjectTitle: 'Science',
                    subjectIcon: Icons.science_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('Science'));
                    }),
                SubjectTile(
                    subjectTitle: 'World Languages',
                    subjectIcon: Icons.translate_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('World Languages'));
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectTile(
                    subjectTitle: 'English',
                    subjectIcon: Icons.menu_book_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('English'));
                    }),
                SubjectTile(
                    subjectTitle: 'Social Studies',
                    subjectIcon: Icons.school_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('Social Studies'));
                    }),
                SubjectTile(
                    subjectTitle: 'Custom Decks',
                    subjectIcon: Icons.build_circle_rounded,
                    action: () {
                      Navigator.pushNamed(context, '/topic',
                          arguments: TopicArguments('Custom Decks'));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
