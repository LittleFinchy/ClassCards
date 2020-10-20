import 'package:flutter/material.dart';
import '../widgets/homePageButton.dart';
import '../widgets/screenConstructor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      newBody: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildHomeButton(
                text: 'Study',
                icon: Icons.edit,
                action: () {
                  Navigator.pushNamed(
                    context,
                    '/subjects',
                  );
                },
              ),
              BuildHomeButton(text: 'Create', icon: Icons.add_to_photos),
            ],
          ),
        ),
      ),
    );
  }
}
