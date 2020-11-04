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
    'Math 1', //1
    'Math 2', //2
    'Math 3', //3
    'Math 4', //4
    'Math 5', //5
    'Math 6', //6
  ],
  'English': [
    'English 1', //1
    'English 2', //2
    'English 3', //3
    'English 4', //4
    'English 5', //5
    'English 6', //6
  ],
  'Science': [
    'Science 1', //1
    'Science 2', //2
    'Science 3', //3
    'Science 4', //4
    'Science 5', //5
    'Science 6', //6
  ],
  'Social Studies': [
    'Social Studies 1', //1
    'Social Studies 2', //2
    'Social Studies 3', //3
    'Social Studies 4', //4
    'Social Studies 5', //5
    'Social Studies 6', //6
  ],
  'World Languages': [
    'World Languages 1', //1
    'World Languages 2', //2
    'World Languages 3', //3
    'World Languages 4', //4
    'World Languages 5', //5
    'World Languages 6', //6
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
