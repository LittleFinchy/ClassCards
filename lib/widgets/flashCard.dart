import 'package:flutter/material.dart';
import '../settings.dart';


class FlashCard extends StatelessWidget {
  final view; // 0 = promt, 1 = answer, 2 = full view
  final String prompt;
  final String answer;
  const FlashCard({Key key, this.view = 0, this.prompt = 'prompt', this.answer = 'answer'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 195,
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
    );
  }
}




class SubjectTile extends StatelessWidget {
  final String subjectTitle;
  final IconData subjectIcon;
  final Function action;
  SubjectTile({
    Key key,
    this.subjectTitle = 'Math',
    this.subjectIcon = Icons.calculate_rounded,
    this.action,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 195,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: action == null ? () {} : action,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  subjectIcon,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  subjectTitle,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
