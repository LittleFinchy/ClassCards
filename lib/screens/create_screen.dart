import 'package:class_cards/widgets/screenConstructor.dart';
import 'package:class_cards/widgets/topicTile.dart';
import 'package:flutter/material.dart';
import '../settings.dart';
import '../data/databaseHandler.dart';
import '../storage.dart';
import 'package:provider/provider.dart';

String inputPrompt;
String inputAnswer;
int inputDeck = 1;

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final StorageApp storage = Provider.of<StorageApp>(context);
    return ScreenWrapper(
      scaffoldKey: scaffoldKey,
      newBody: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EnterPrompt(),
              EnterAnswer(),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white, //color: appButtonColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: -15,
                      blurRadius: 25,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: inputDeck,
                    items: [
                      DropdownMenuItem(
                        child: Text('Custom Deck 1'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Custom Deck 2'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Custom Deck 3'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('Custom Deck 4'),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text('Custom Deck 5'),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text('Custom Deck 6'),
                        value: 6,
                      ),
                    ],
                    onChanged: (value) {
                      setState(
                        () {
                          inputDeck = value;
                        },
                      );
                      print(inputPrompt);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: TopicTile(
                  topicTitle: 'Create Card',
                  //action: take the input text and save it to the database,
                  action: () {
                    storage.storage.addToSCData(
                      FlashCardData(
                        subject: 'Custom Decks',
                        topic: inputDeck.toString(),
                        prompt: inputPrompt,
                        answer: inputAnswer,
                      ),
                    );
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EnterPrompt extends StatefulWidget {
  @override
  _EnterPromptState createState() => _EnterPromptState();
}

class _EnterPromptState extends State<EnterPrompt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 300,
      decoration: BoxDecoration(
        color: Settings.of(context).appButtonColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: -15,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Enter Prompt',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  //labelText: "Enter Answer",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    inputPrompt = val;
                  });
                },
                // validator: (val) {
                //   if (val.length == 0) {
                //     return "Answer cannot be empty";
                //   } else {
                //     return null;
                //   }
                // },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EnterAnswer extends StatefulWidget {
  @override
  _EnterAnswerState createState() => _EnterAnswerState();
}

class _EnterAnswerState extends State<EnterAnswer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 300,
      decoration: BoxDecoration(
        color: Settings.of(context).appButtonColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: -15,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Enter Answer',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  //labelText: "Enter Answer",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    inputAnswer = val;
                  });
                },
                // validator: (val) {
                //   if (val.length == 0) {
                //     return "Answer cannot be empty";
                //   } else {
                //     inputAnswer = val;
                //     return null;
                //   }
                // },
              ),
            ),
          )
        ],
      ),
    );
  }
}
