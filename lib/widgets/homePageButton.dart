import 'package:flutter/material.dart';
import '../settings.dart';

class BuildHomeButton extends StatelessWidget {
  final String text;
  final Icon icon;
  const BuildHomeButton({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        shape: BoxShape.circle,
        color: appButtonColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: -10,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
