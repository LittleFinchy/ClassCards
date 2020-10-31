import '../widgets/FlashCardList.dart';
import 'package:flutter/material.dart';
import '../widgets/screenConstructor.dart';
import '../widgets/dataTypes.dart';
import 'package:provider/provider.dart';
import '../storage.dart';

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
  @override
  Widget build(BuildContext context) {
    final StorageApp app = Provider.of<StorageApp>(context);
    final StudyArguments args = StudyArguments(widget.subject, widget.topic);
    return ScreenWrapper(
      newBody: Container(
        child: Center(
          child: FlashCardList(args: args, storage: app),
        ),
      ),
    );
  }
}
