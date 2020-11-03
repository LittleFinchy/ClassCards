import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody: Container(),
    );
  }
}
