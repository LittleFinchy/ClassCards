import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'dataTypes.dart';
import '../data/databaseHandler.dart';
import '../storage.dart';
import 'package:provider/provider.dart';
import 'package:class_cards/widgets/topicTile.dart';
import 'dart:io';

class FlashCardList extends StatefulWidget {
  final StudyArguments args;
  const FlashCardList({Key key, @required this.args}) : super(key: key);
  @override
  _FlashCards createState() => _FlashCards();
}

class _FlashCards extends State<FlashCardList> {
  StudyCardDatabase db;

  @override
  Widget build(BuildContext context) {
    final StorageApp storage = Provider.of<StorageApp>(context);
    return Container(
      child: FutureBuilder<Object>(
        future:
            storage.storage.pullSCGroup(widget.args.subject, widget.args.topic),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(child: Text('Throw Waiting'));
            default:
              if (snapshot.hasError)
                return Container(
                  height: 150,
                  width: 200,
                  child: TopicTile(
                    topicTitle:
                        'An Error Has Occured, Please Click And Reload App',
                    //action: take the input text and save it to the database,
                    action: () {
                      exit(0);
                    },
                  ),
                );
              else {
                List<FlashCardData> entries = snapshot.data;
                if (entries.length > 0) {
                  List<Widget> widgetList = List<Widget>();
                  for (var i = 0; i < entries.length; i++) {
                    widgetList.add(FlashCard(
                        prompt: entries[i].prompt, answer: entries[i].answer));
                  }
                  return ListWheelScrollView(
                    diameterRatio: 5,
                    itemExtent: 500,
                    children: widgetList,
                  );
                }
                return Container(
                  height: 50,
                  width: 200,
                  child: TopicTile(
                    topicTitle: 'This Deck is Empty',
                    //action: take the input text and save it to the database,
                    action: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   Widget newWidget = FutureBuilder(
  //     future: db.retrieveList(widget.args.subject, widget.args.topic),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<List<FlashCardData>> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting:
  //           return Container(child: Text('Throw 1'));
  //         default:
  //           if (snapshot.hasError)
  //             return Container(child: Text('Throw 2'));
  //           else {
  //             List<FlashCardData> entries = snapshot.data;
  //             if (entries.length > 0) {
  //               List<Widget> widgetList = List<Widget>();
  //               for (var i = 0; i < entries.length; i++) {
  //                 widgetList.add(FlashCard(
  //                     prompt: entries[i].prompt, answer: entries[i].answer));
  //               }
  //               return ListWheelScrollView(
  //                 diameterRatio: 5,
  //                 itemExtent: 500,
  //                 children: widgetList,
  //               );
  //             }
  //             return Container(child: Text('Throw 3'));
  //           }
  //       }
  //     },
  //   );
  // db.retrieveList(widget.args.subject, widget.args.topic).then(
  //   (result) {
  //     setState(
  //       () {
  //         List<FlashCardData> entries = result;
  //         if (entries.length > 0) {
  //           List<Widget> widgetList = List<Widget>();
  //           for (var i = 0; i < entries.length; i++) {
  //             widgetList.add(FlashCard(
  //                 prompt: entries[i].prompt, answer: entries[i].answer));
  //           }
  //           newWidget = ListWheelScrollView(
  //             diameterRatio: 5,
  //             itemExtent: 500,
  //             children: widgetList,
  //           );
  //         }
  //         newWidget = Container();
  //       },
  //     );
  //   },
  //   onError: () {
  //     newWidget = Container();
  //   },
  // );
  //   return newWidget;
  // }
}
