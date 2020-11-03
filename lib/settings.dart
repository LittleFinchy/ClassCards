import 'package:flutter/material.dart';

Color appBarColorO = Color(0xFFE56D47); //orange
Color appBodyColorO = Color(0xFFD96744);
Color appButtonColorO = Color(0xFFDC7654);

Color appBarColorP = Color(0xFF9E48E5); //purple
Color appBodyColorP = Color(0xFF9645D9);
Color appButtonColorP = Color(0xFFA056DC);

Color appBarColorR = Color(0xFFD00606); //red
Color appBodyColorR = Color(0xFFC01616);
Color appButtonColorR = Color(0xFFD42B2B);

Color appBarColorB = Color(0xFF1D5AAF); //blue
Color appBodyColorB = Color(0xFF2065C5);
Color appButtonColorB = Color(0xFF2671D9);

// colors being used
// Color appBarColor = appBarColorP;
// Color appBodyColor = appBodyColorP;
// Color appButtonColor = appButtonColorP;

List<Color> appBarColorList = [
  Color(0xFFE56D47),
  Color(0xFF9E48E5),
  Color(0xFF1D5AAF),
  Color(0xFFD00606),
];
List<Color> appBodyColorList = [
  Color(0xFFD96744),
  Color(0xFF9645D9),
  Color(0xFF2065C5),
  Color(0xFFC01616),
];
List<Color> appButtonColorList = [
  Color(0xFFDC7654),
  Color(0xFFA056DC),
  Color(0xFF2671D9),
  Color(0xFFD42B2B),
];

class Settings extends InheritedWidget {
  Settings({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  int selection;
  static int initialSelection = 1;

  static Settings of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  void setTheme(int newColor) {
    selection = newColor;
  }

  Color get appBarColor {
    selection = selection == null ? initialSelection : selection;
    return appBarColorList[selection];
  }

  Color get appBodyColor {
    selection = selection == null ? initialSelection : selection;
    return appBodyColorList[selection];
  }

  Color get appButtonColor {
    selection = selection == null ? initialSelection : selection;
    return appButtonColorList[selection];
  }

  @override
  bool updateShouldNotify(Settings oldWidget) =>
      selection != oldWidget.selection;
}

// class SettingsObject extends State<Settings> {
//   int selection;
//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }
