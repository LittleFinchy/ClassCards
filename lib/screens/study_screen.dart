import '../widgets/FlashCardList.dart';
import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/dataTypes.dart';

class StudyScreen extends StatefulWidget {
  final String subject;
  final String topic;
  const StudyScreen({
    Key key,
    this.subject = 'Math',
    this.topic = '1',
  }) : super(key: key);
  @override
  _StudyScreen createState() => _StudyScreen();
}

class _StudyScreen extends State<StudyScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final StudyArguments args = StudyArguments(widget.subject, widget.topic);
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody: Container(
        child: Center(
          child: FlashCardList(args: args),
        ),
      ),
    );
  }
}
