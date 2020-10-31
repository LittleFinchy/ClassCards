import 'package:flutter/material.dart';
import '../settings.dart';

class SubjectTile extends StatelessWidget {
  final String subjectTitle;
  final IconData subjectIcon;
  final bool disabled;
  final Function action;
  SubjectTile({
    Key key,
    this.subjectTitle = 'Math',
    this.subjectIcon = Icons.calculate_rounded,
    this.disabled = false,
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
            onTap: (action == null) | disabled ? () {} : action,
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
