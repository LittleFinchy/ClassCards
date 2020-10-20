import 'package:flutter/material.dart';
import '../settings.dart';
import '../widgets/homePageButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildHomeButton(
              text: 'Study',
              icon: Icon(
                Icons.edit,
                color: Colors.white,
                size: 50,
              ),
            ),
            BuildHomeButton(
              text: 'Create',
              icon: Icon(
                Icons.add_to_photos,
                color: Colors.white,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
