import '../widgets/flashCard.dart';
import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/subjectTile.dart';


class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      newBody: Container(
        child: Center(
          child: ListWheelScrollView(
            diameterRatio: 3,
            itemExtent: 400,
            children: [
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
              FlashCard(),
            ],
          ),
        ),
      ),
    );
  }
}