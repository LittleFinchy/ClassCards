import 'package:flutter/material.dart';
import '../settings.dart';
import '../widgets/subjectTile.dart';

class SubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: const EdgeInsets.all(10),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SubjectTile(
              subjectTitle: 'Math',
              subjectIcon:
                  Icon(Icons.calculate_rounded, size: 80, color: Colors.white,),
            ),
            SubjectTile(
              subjectTitle: 'Science',
              subjectIcon:
                  Icon(Icons.science_rounded, size: 80, color: Colors.white,),
            ),
            SubjectTile(
              subjectTitle: 'English',
              subjectIcon:
                  Icon(Icons.menu_book_rounded, size: 80, color: Colors.white,),
            ),
            SizedBox(height: 20),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            SubjectTile(
              subjectTitle: 'Social Studies',
              subjectIcon:
                  Icon(Icons.school_rounded, size: 80, color: Colors.white,),
            ),
            SubjectTile(
              subjectTitle: 'World Languages',
              subjectIcon:
                  Icon(Icons.translate_rounded, size: 80, color: Colors.white,),
            ),
            SubjectTile(
              subjectTitle: 'Custom Decks',
              subjectIcon: Icon(
                Icons.build_circle_rounded,
                size: 80,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
