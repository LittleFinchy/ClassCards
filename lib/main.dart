import 'package:class_cards/screens/study_screen.dart';
import 'package:class_cards/widgets/dataTypes.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/subjects_screen.dart';
import 'package:class_cards/screens/topic_screen.dart';
import 'storage.dart';
import 'data/databaseHandler.dart';
import 'package:provider/provider.dart';
import 'screens/settings_screen.dart';
import 'screens/create_screen.dart';
import 'screens/info_screen.dart';
import 'settings.dart';

void main() {
  runApp(Nav());
}

class Nav extends StatelessWidget {
  static var provider = StorageApp(null);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Storage>(
      future: Storage.createFrom(
        scFuture: StudyCardDatabase.create(),
      ),
      builder: (context, snapshot) {
        final repository = snapshot.data;
        provider = StorageApp(repository);
        return MaterialApp(
          builder: (context, child) => SafeArea(
            child: Settings(
              child: child,
              selection: Settings.initialSelection,
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) {
                return _makeRoute(
                    context: context,
                    routeName: settings.name,
                    arguments: settings.arguments);
              },
              maintainState: true,
              fullscreenDialog: false,
            );
          },
        );
      },
    );
  }

  Widget _makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    final Widget child = _buildRoute(
      context: context,
      routeName: routeName,
      arguments: arguments,
    );
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case '/':
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: HomeScreen(),
        );
      case '/subjects':
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: SubjectScreen(),
        );
      case '/topic':
        final map = arguments as TopicArguments;
        final subject = map.subject;
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: TopicScreen(subject: subject),
        );
      case '/study':
        final map = arguments as StudyArguments;
        final subject = map.subject;
        final topic = map.topic;
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: StudyScreen(subject: subject, topic: topic),
        );
      case '/settings':
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: SettingsScreen(),
        );
      case '/create':
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: CreateScreen(),
        );
      case '/info':
        return MultiProvider(
          providers: [ListenableProvider<StorageApp>(create: (_) => provider)],
          child: InfoScreen(),
        );
      default:
        return Container();
    }
  }
}
