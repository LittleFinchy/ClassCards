import 'package:flutter/material.dart';
import '../settings.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/topicTile.dart';

class TopicScreen extends StatelessWidget {
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
                TopicTile(
                  topicTitle: 'Basic Math',
                ),
                TopicTile(
                  topicTitle: 'Math 2',
                ),
                TopicTile(
                  topicTitle: 'Math 3',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopicTile(
                  topicTitle: 'Social Studies',
                ),
                TopicTile(
                  topicTitle: 'World Languages',
                ),
                TopicTile(
                  topicTitle: 'Custom Decks',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
