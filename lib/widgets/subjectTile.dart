import 'package:flutter/material.dart';
import '../settings.dart';

class SubjectTile extends StatelessWidget {
  final String subjectTitle;
  final Icon subjectIcon;
  final GestureTapCallback action;
  SubjectTile({
    Key key,
    this.subjectTitle = 'Math',
    this.subjectIcon,
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
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subjectIcon,
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
//image: DecorationImage(image: AssetImage("assets/images/math.png"))

List subject_icons = [
  Icon(Icons.calculate_rounded),
  Icon(Icons.menu_book_rounded),
  Icon(Icons.science_rounded),
  Icon(Icons.school_rounded),
  Icon(Icons.translate_rounded),
];
