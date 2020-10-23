import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/topicTile.dart';
import 'study_screen.dart';

class TopicScreen extends StatelessWidget {
  final String subject;
  const TopicScreen({
    Key key,
    this.subject = 'Math',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TopicArguments args = ModalRoute.of(context).settings.arguments;
    return ScreenWrapper(
      newBody: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopicTile(
                    topicTitle: args.subject + ' 1',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '1'));
                    }),
                TopicTile(
                    topicTitle: args.subject + ' 3',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '3'));
                    }),
                TopicTile(
                    topicTitle: args.subject + ' 5',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '5'));
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopicTile(
                    topicTitle: args.subject + ' 2',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '2'));
                    }),
                TopicTile(
                    topicTitle: args.subject + ' 4',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '4'));
                    }),
                TopicTile(
                    topicTitle: args.subject + ' 6',
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(args.subject, '6'));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopicArguments {
  final String subject;
  TopicArguments(this.subject);
}
