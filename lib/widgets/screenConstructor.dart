import 'package:flutter/material.dart';
import '../settings.dart';
import '../drawer.dart';

class ScreenWrapper extends StatefulWidget {
  final Container newBody;
  final GlobalKey<ScaffoldState> scaffoldKey;
  ScreenWrapper({
    Key key,
    this.newBody,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  _ScreenWrapperState createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: Settings.of(context).appBodyColor, //appBodyColor
        appBar: AppBar(
          backgroundColor: Settings.of(context).appBarColor,
          title: Text('Flashi',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/info',
                ).then(
                  (value) {
                    setState(
                      () {
                        Settings.of(context).setTheme(
                            Settings.of(context).selection == null
                                ? 0
                                : Settings.of(context).selection);
                      },
                    );
                  },
                );
              },
            ),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        ),
        body: widget.newBody,
        drawer: Scaffold(
          backgroundColor: Colors.transparent,
          body: MyDrawer(),
        ),
      ),
    );
  }
}

/// TEMPLATE NEW SCREEN ///

// import 'package:class_cards/widgets/screenConstructor.dart';
// import 'package:flutter/material.dart';

// class CreateScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenWrapper(
//       newBody: Container(
//       ),
//     );
//   }
// }
