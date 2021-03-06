import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/topicTile.dart';
import '../widgets/dataTypes.dart';

class TopicScreen extends StatelessWidget {
  final String subject;
  TopicScreen({
    Key key,
    this.subject = 'Math',
  }) : super(key: key);
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
                TopicTile(
                    topicTitle: topicNames[subject][0],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '1'));
                    }),
                TopicTile(
                    topicTitle: topicNames[subject][2],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '3'));
                    }),
                TopicTile(
                    topicTitle: topicNames[subject][4],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '5'));
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopicTile(
                    topicTitle: topicNames[subject][1],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '2'));
                    }),
                TopicTile(
                    topicTitle: topicNames[subject][3],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '4'));
                    }),
                TopicTile(
                    topicTitle: topicNames[subject][5],
                    action: () {
                      Navigator.pushNamed(context, '/study',
                          arguments: StudyArguments(subject, '6'));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
