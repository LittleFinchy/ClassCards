import 'package:flutter/material.dart';
import '../settings.dart';

class FlashCard extends StatelessWidget {
  final view; // 0 = promt, 1 = answer, 2 = full view
  final String prompt;
  final String answer;
  const FlashCard(
      {Key key, this.view = 2, this.prompt = 'prompt', this.answer = 'answer'})
      : super(key: key);
  bool notNull(Object o) => o != null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 340,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(30),
        color: appButtonColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: -15,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            view != 1 ? Text(prompt) : null,
            view != 0 ? Text(answer) : null,
          ].where(notNull).toList()),
    );
  }
}
