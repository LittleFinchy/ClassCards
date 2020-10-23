import '../widgets/flashCard.dart';
import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudyArguments args = ModalRoute.of(context).settings.arguments;
    return ScreenWrapper(
      newBody: Container(
        child: Center(
          child: ListWheelScrollView(
            diameterRatio: 5,
            itemExtent: 500,
            children: [
              FlashCard(
                prompt: args.subject,
                answer: args.topic,
              ),
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

class StudyArguments {
  final String subject;
  final String topic;
  StudyArguments(this.subject, this.topic);
}
