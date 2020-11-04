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

Map<String, List<String>> topicNames = {
  'Math': [
    'Basic', //1
    'Intermediate', //2
    'Trigonometry', //3
    'Algebra', //4
    'Geometry', //5
    'Calculus', //6
  ],
  'English': [
    'Grammar', //1
    'Spelling', //2
    'Vocabulary', //3
    'Literature', //4
    'MLA Formatting', //5
    'APA Formatting', //6
  ],
  'Science': [
    'Physics', //1
    'Chemistry', //2
    'Biology', //3
    'Geology', //4
    'Astronomy', //5
    'Environmental Science', //6
  ],
  'Social Studies': [
    'American History', //1
    'World History', //2
    'Roman History', //3
    'Geography', //4
    'Philosophy', //5
    'Economics', //6
  ],
  'World Languages': [
    'Spanish', //1
    'French', //2
    'German', //3
    'Italian', //4
    'Russian', //5
    'Portuguese', //6
  ],
  'Custom Decks': [
    'Custom Deck 1',
    'Custom Deck 2',
    'Custom Deck 3',
    'Custom Deck 4',
    'Custom Deck 5',
    'Custom Deck 6',
  ]
};
