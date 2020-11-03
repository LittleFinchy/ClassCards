import 'package:flutter/material.dart';
import 'dart:math';

// Color appBarColorO = Color(0xFFE56D47); //orange
// Color appBodyColorO = Color(0xFFD96744);
// Color appButtonColorO = Color(0xFFDC7654);

// Color appBarColorP = Color(0xFF9E48E5); //purple
// Color appBodyColorP = Color(0xFF9645D9);
// Color appButtonColorP = Color(0xFFA056DC);

// Color appBarColorR = Color(0xFFD00606); //red
// Color appBodyColorR = Color(0xFFC01616);
// Color appButtonColorR = Color(0xFFD42B2B);

// Color appBarColorB = Color(0xFF1D5AAF); //blue
// Color appBodyColorB = Color(0xFF2065C5);
// Color appButtonColorB = Color(0xFF2671D9);

// // colors being used
// Color appBarColor = appBarColorP;
// Color appBodyColor = appBodyColorP;
// Color appButtonColor = appButtonColorP;

// List<Color> appBarColorList = [
//   Color(0xFFE56D47),
//   Color(0xFF9E48E5),
//   Color(0xFF1D5AAF),
//   Color(0xFFD00606),
// ];
// List<Color> appBodyColorList = [
//   Color(0xFFD96744),
//   Color(0xFF9645D9),
//   Color(0xFF2065C5),
//   Color(0xFFC01616),
// ];
// List<Color> appButtonColorList = [
//   Color(0xFFDC7654),
//   Color(0xFFA056DC),
//   Color(0xFF2671D9),
//   Color(0xFFD42B2B),
// ];

class Settings extends InheritedWidget {
  Settings({
    Key key,
    @required Widget child,
    this.selection,
  }) : super(key: key, child: child);

  static List<Color> appBarColorList = [
    Color(0xFFE56D47),
    Color(0xFF9E48E5),
    Color(0xFF1D5AAF),
    Color(0xFFD00606),
  ];
  static List<Color> appBodyColorList = [
    Color(0xFFD96744),
    Color(0xFF9645D9),
    Color(0xFF2065C5),
    Color(0xFFC01616),
  ];
  static List<Color> appButtonColorList = [
    Color(0xFFDC7654),
    Color(0xFFA056DC),
    Color(0xFF2671D9),
    Color(0xFFD42B2B),
  ];

  static List<List<String>> appCardBackgroundList = [
    [
      'assets/Orange FLASHi 1.png',
      'assets/Orange FLASHi 2.png',
      'assets/Orange FLASHi 3.png',
      'assets/Orange FLASHi 4.png'
    ],
    [
      'assets/Purple FLASHi 1.png',
      'assets/Purple FLASHi 2.png',
      'assets/Purple FLASHi 3.png',
      'assets/Purple FLASHi 4.png'
    ],
    [
      'assets/Blue FLASHi 1.png',
      'assets/Blue FLASHi 2.png',
      'assets/Blue FLASHi 3.png',
      'assets/Blue FLASHi 4.png'
    ],
    [
      'assets/Orange FLASHi 1.png',
      'assets/Orange FLASHi 2.png',
      'assets/Orange FLASHi 3.png',
      'assets/Orange FLASHi 4.png'
    ],
  ];

  int selection;
  static int initialSelection = 0;
  var rnd = new Random();

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

  AssetImage get appCardBackground {
    selection = selection == null ? initialSelection : selection;
    int i = rnd.nextInt(3) + 1;
    return AssetImage(appCardBackgroundList[selection][i]);
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
