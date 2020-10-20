import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/subjectTile.dart';

class SubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
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
                ),
                SubjectTile(
                  subjectTitle: 'Science',
                  subjectIcon: Icons.science_rounded,
                ),
                SubjectTile(
                  subjectTitle: 'English',
                  subjectIcon: Icons.menu_book_rounded,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SubjectTile(
                  subjectTitle: 'Social Studies',
                  subjectIcon: Icons.school_rounded,
                ),
                SubjectTile(
                  subjectTitle: 'World Languages',
                  subjectIcon: Icons.translate_rounded,
                ),
                SubjectTile(
                  subjectTitle: 'Custom Decks',
                  subjectIcon: Icons.build_circle_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
