import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      newBody: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [EnterPrompt(), EnterAnswer(), DropdownButton()],
        ),
      ),
    );
  }
}

class EnterPrompt {}

class EnterAnswer {}
