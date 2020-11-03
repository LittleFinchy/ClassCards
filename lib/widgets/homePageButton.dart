import 'package:flutter/material.dart';
import '../settings.dart';

class BuildHomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function action;
  const BuildHomeButton({
    Key key,
    this.text = 'Study',
    this.icon = Icons.edit,
    this.action,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        shape: BoxShape.circle,
        color: Settings.of(context).appButtonColor,
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
            onTap: action == null ? () {} : action,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
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
