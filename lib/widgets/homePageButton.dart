import 'package:flutter/material.dart';
import '../settings.dart';

class _buildButton extends StatelessWidget {
  final String text;
  final Icon icon;
  const _buildButton({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
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
            new BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(50, 0),
            ),
          ],
        ),
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
