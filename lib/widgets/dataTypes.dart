import 'package:flutter/material.dart';

class TopicArguments {
  final String subject;
  TopicArguments(this.subject);
}

class StudyArguments {
  final String subject;
  final String topic;
  StudyArguments(this.subject, this.topic);
}

SnackBar soonSnack = SnackBar(
  content: Text('Coming Soon(TM)!'),
  duration: Duration(milliseconds: 600),
);
