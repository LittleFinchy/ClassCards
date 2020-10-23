import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      newBody: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('This is a test')],
        ),
      ),
    );
  }
}
