import 'package:flutter/material.dart';
import '../settings.dart';

class TopicTile extends StatelessWidget {
  final String topicTitle;
  final GestureTapCallback action;
  TopicTile({
    Key key,
    this.topicTitle,
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
            child: Text(
              topicTitle,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
