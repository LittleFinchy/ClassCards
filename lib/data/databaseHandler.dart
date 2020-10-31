import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String databasePath = 'studyCards.db';
final String tableName = 'StudyCards';
final String idName = 'IDs';
final String subjectName = 'Subject';
final String topicName = 'Topic';
final String promptName = 'Prompt';
final String answerName = 'Answer';

class StudyCardDatabase {
  Database db;

  StudyCardDatabase._(this.db);

  static Future<StudyCardDatabase> create() async =>
      StudyCardDatabase._(await open());

  static Future<Database> open() async {
    String basePath = await getDatabasesPath();
    await deleteDatabase(join(basePath, databasePath));
    return await openDatabase(
      join(basePath, databasePath),
      version: 9,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table $tableName(
            $idName integer primary key autoincrement,
            $subjectName text not null,
            $topicName text not null,
            $promptName text not null,
            $answerName text not null)''');
        final data = initialDatabase;
        Batch batch = db.batch();
        for (var i = 0; i < data.length; i++) {
          batch.rawInsert(
            '''INSERT INTO $tableName($subjectName, $topicName, $promptName, $answerName) VALUES(?, ?, ?, ?)''',
            [
              data[i].subject,
              data[i].topic,
              data[i].prompt,
              data[i].answer,
            ],
          );
        }
        await batch.commit();
      },
    );
  }

  Future<void> buildInitialDB() async {
    await insertBatch([
      FlashCardData(
          subject: 'Math', topic: '1', prompt: '1 + 1 = ', answer: '2'),
      FlashCardData(
          subject: 'Math', topic: '1', prompt: '2 + 2 = ', answer: '5')
    ]);
  }

  Future<void> insert(FlashCardData data) async {
    await db.rawInsert(
      '''INSERT INTO $tableName($subjectName, $topicName, $promptName, $answerName) VALUES(?, ?, ?, ?)''',
      [
        data.subject,
        data.topic,
        data.prompt,
        data.answer,
      ],
    );
  }

  Future<void> insertBatch(List<FlashCardData> data) async {
    Batch batch = db.batch();
    for (var i = 0; i < data.length; i++) {
      batch.rawInsert(
        '''INSERT INTO $tableName($subjectName, $topicName, $promptName, $answerName) VALUES(?, ?, ?, ?)''',
        [
          data[i].subject,
          data[i].topic,
          data[i].prompt,
          data[i].answer,
        ],
      );
    }
    await batch.commit();
  }

  Future<void> update(FlashCardData data) async {
    await db.rawUpdate(
        '''UPDATE $tableName SET $promptName = ?, $answerName = ?) WHERE $idName = ?''',
        [data.prompt, data.answer, data.id]);
  }

  Future<List<FlashCardData>> retrieveList(String subject, String topic) async {
    List<Map> maps = await db.rawQuery(
      '''SELECT * FROM $tableName WHERE $subjectName = ? AND $topicName = ?''',
      [subject, topic],
    );
    List<FlashCardData> cardList = List<FlashCardData>();
    for (var i = 0; i < maps.length; i++) {
      cardList.add(FlashCardData.fromMap(maps[i]));
    }
    // print(await db.rawQuery('''SELECT * FROM $tableName'''));
    return cardList;
  }

  Future<void> delete(FlashCardData data) async {
    await db
        .rawDelete('''DELETE FROM $tableName WHERE $idName = ?''', [data.id]);
  }

  Future<void> reloadTable(String path) async {
    await deleteDatabase(path);
    open();
  }

  Future close() async => db.close();
}

class FlashCardData {
  int id = -1;
  String subject;
  String topic;
  String prompt;
  String answer;
  FlashCardData({this.subject, this.topic, this.prompt, this.answer});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      idName: id,
      subjectName: subject,
      topicName: topic,
      promptName: prompt,
      answerName: answer,
    };
    return map;
  }

  FlashCardData.fromMap(Map<String, dynamic> map) {
    id = map[idName];
    subject = map[subjectName];
    topic = map[topicName];
    prompt = map[promptName];
    answer = map[answerName];
  }
}

final initialDatabase = [
  FlashCardData(subject: 'Math', topic: '1', prompt: '1 + 1 = ', answer: '2'),
  FlashCardData(subject: 'Math', topic: '1', prompt: '2 + 2 = ', answer: '5'),
];
