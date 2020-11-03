import 'package:flutter/material.dart';
import '../widgets/homePageButton.dart';
import '../widgets/screenConstructor.dart';

class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
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
              BuildHomeButton(
                text: 'Create',
                icon: Icons.add_to_photos,
                action: () {
                  Navigator.pushNamed(
                    context,
                    '/create',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
