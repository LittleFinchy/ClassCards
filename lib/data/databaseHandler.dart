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

  Future<void> reloadTable() async {
    String basePath = await getDatabasesPath();
    await deleteDatabase(join(basePath, databasePath));
    // StudyCardDatabase._(await open());
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
//Math - Basic
  FlashCardData(subject: 'Math', topic: '1', prompt: '1 + 1 = ', answer: '2'),
  FlashCardData(subject: 'Math', topic: '1', prompt: '12 - 9 = ', answer: '3'),
  FlashCardData(subject: 'Math', topic: '1', prompt: '2 + 2 = ', answer: '5'),
//Math - Intermediate
  FlashCardData(subject: 'Math', topic: '2', prompt: '20 / 4', answer: '5'),
  FlashCardData(subject: 'Math', topic: '2', prompt: '36 * 12', answer: '432'),
  FlashCardData(subject: 'Math', topic: '2', prompt: '25^2', answer: '625'),
//Math - Trig
  FlashCardData(
      subject: 'Math',
      topic: '3',
      prompt: 'Relation between sine and cosine',
      answer: 'sin^2 + cos^2 = 1'),
  FlashCardData(
      subject: 'Math',
      topic: '3',
      prompt: 'Area of a triangle',
      answer: 'BH/2'),
  FlashCardData(
      subject: 'Math',
      topic: '3',
      prompt: 'Convert polar to cartesian',
      answer: 'x = r × cos( θ ), y = r × sin( θ )'),
//Math - Algebra
  FlashCardData(
      subject: 'Math',
      topic: '4',
      prompt: 'Solve for X: X^2 - 2X + 1 = 0',
      answer: 'X = -1, 1'),
  FlashCardData(
      subject: 'Math',
      topic: '4',
      prompt: 'Algebraic definition of a circle:',
      answer: 'X^2 + Y^2 = R^2'),
  FlashCardData(
      subject: 'Math',
      topic: '4',
      prompt: 'What is the Quotient Rule',
      answer:
          'Divide two powers with the same base by subtracting the exponents'),
//Math - Geometry
  FlashCardData(
      subject: 'Math',
      topic: '5',
      prompt: 'Sum of interior angles of a triangle',
      answer: '180'),
  FlashCardData(
      subject: 'Math',
      topic: '5',
      prompt: 'Area of a circle',
      answer: 'PI*r^2'),
  FlashCardData(
      subject: 'Math',
      topic: '5',
      prompt: 'Circumference of a circle',
      answer: '2*PI*r'),
//Math - Calculus
  FlashCardData(
      subject: 'Math',
      topic: '6',
      prompt: 'Derivative of a constant function',
      answer: 'f(x) = c where c is a constant'),
  FlashCardData(
      subject: 'Math',
      topic: '6',
      prompt: 'Derivative of a power function (power rule)',
      answer: 'f(x) = x^r where r is a constant real number '),
  FlashCardData(
      subject: 'Math',
      topic: '6',
      prompt: 'Derivative of the sum of functions (sum rule)',
      answer: 'f(x) = g(x) + h(x)'),

// English - Grammar
  FlashCardData(
      subject: 'English',
      topic: '1',
      prompt: 'What is the most common english letter',
      answer: 'E'),
  FlashCardData(
      subject: 'English',
      topic: '1',
      prompt: 'What is the dot over the letter i and j',
      answer: 'Superscript dot'),
  FlashCardData(
      subject: 'English',
      topic: '1',
      prompt: 'What is the shortest complete sentence',
      answer: 'I am.'),
// English - Spelling
  FlashCardData(
      subject: 'English',
      topic: '2',
      prompt: 'i before e except after..',
      answer: 'C'),
  FlashCardData(
      subject: 'English',
      topic: '2',
      prompt: 'ph can sometimes sound like',
      answer: 'F'),
  FlashCardData(
      subject: 'English',
      topic: '2',
      prompt: 'How many vowels are there',
      answer: '5'),
// English - Vocabulary
  FlashCardData(
      subject: 'English',
      topic: '3',
      prompt: 'Precipitation',
      answer: 'rain, snow, sleet'),
  FlashCardData(
      subject: 'English',
      topic: '3',
      prompt: 'Duplicate',
      answer: 'make or be an exact copy'),
  FlashCardData(
      subject: 'English',
      topic: '3',
      prompt: 'Hypothesis',
      answer: 'proposed explanation'),
// English - Literature
  FlashCardData(
      subject: 'English',
      topic: '4',
      prompt: 'this sentence is false',
      answer: '(the universe implodes)'),
  FlashCardData(
      subject: 'English', topic: '4', prompt: 'Hi Mom!!', answer: 'yeet'),
  FlashCardData(
      subject: 'English',
      topic: '4',
      prompt: 'Honestly its 2 AM and Im betting on noone even',
      answer: 'looking in this topic'),
// English - MLA Formatting
  FlashCardData(
      subject: 'English',
      topic: '5',
      prompt: 'Abbreviation for "example"',
      answer: 'e.g.'),
  FlashCardData(
      subject: 'English',
      topic: '5',
      prompt: 'Abbreviation for "revised"',
      answer: 'rev.'),
  FlashCardData(
      subject: 'English',
      topic: '5',
      prompt: 'Abbreviation for "volume"',
      answer: 'vol.'),
// English - APA Formatting
  FlashCardData(
      subject: 'English',
      topic: '6',
      prompt: 'Format of in-text citation',
      answer: '(Last Name, Year)'),
  FlashCardData(
      subject: 'English',
      topic: '6',
      prompt: 'Format for short quotations',
      answer: 'Name (Year) ... (p. #)'),
  FlashCardData(
      subject: 'English',
      topic: '6',
      prompt: 'Format for paraphrasing',
      answer: 'Name (Year)'),

//Science - Physics
  FlashCardData(
      subject: 'Science',
      topic: '1',
      prompt: 'The first law of thermodynamics',
      answer: 'energy can neither be created nor destroyed'),
  FlashCardData(
      subject: 'Science',
      topic: '1',
      prompt: 'The second law of thermodynamics',
      answer: ' the entropy of any isolated system always increases'),
  FlashCardData(
      subject: 'Science',
      topic: '1',
      prompt: 'The third law of thermodynamics',
      answer: 'The entropy of a system at absolute zero approaches zero'),
//Science - Chemistry
  FlashCardData(
      subject: 'Science',
      topic: '2',
      prompt: 'Chemical formula for water',
      answer: 'H2O'),
  FlashCardData(
      subject: 'Science',
      topic: '2',
      prompt: 'How much salt (NaCl) is in the average adult human body',
      answer: '250 grams'),
  FlashCardData(
      subject: 'Science',
      topic: '2',
      prompt: 'What is the most abundant protein in the human body',
      answer: 'Collagen'),
//Science - Biology
  FlashCardData(
      subject: 'Science',
      topic: '3',
      prompt: 'How many pairs of chromosomes are there in humans',
      answer: '23'),
  FlashCardData(
      subject: 'Science',
      topic: '3',
      prompt: 'What does the immune system do',
      answer: 'Fight off infections'),
  FlashCardData(
      subject: 'Science',
      topic: '3',
      prompt: 'What is homeostasis',
      answer: 'The tendency of the body to reach a stable equilibrium'),
//Science - Geology
  FlashCardData(
      subject: 'Science',
      topic: '4',
      prompt: 'Stones that are more rare than diamonds',
      answer: 'Rubies, sapphires and emeralds'),
  FlashCardData(
      subject: 'Science',
      topic: '4',
      prompt: 'Are all diamonds are transparent',
      answer: 'No'),
  FlashCardData(
      subject: 'Science',
      topic: '4',
      prompt: 'What is the rock cycle',
      answer: 'The process where rocks change from one type to another'),
//Science - Astronomy
  FlashCardData(
      subject: 'Science',
      topic: '5',
      prompt: 'Which planet is called "Evening Star"',
      answer: 'Venus'),
  FlashCardData(
      subject: 'Science',
      topic: '5',
      prompt: "Average temperature of the Sun's surface",
      answer: '10 million degrees Fahrenheit'),
  FlashCardData(
      subject: 'Science',
      topic: '5',
      prompt: 'Largest moon in solar system',
      answer: 'Ganymede'),
//Science - Environmental Science
  FlashCardData(
      subject: 'Science',
      topic: '6',
      prompt: 'Rainforests are responsible for how much of the worlds oxygen',
      answer: '28%'),
  FlashCardData(
      subject: 'Science',
      topic: '6',
      prompt: 'How many types of soil are there',
      answer: 'Six Types'),
  FlashCardData(
      subject: 'Science',
      topic: '6',
      prompt: 'What is water cycle',
      answer: 'The path that all water follows as it moves around Earth'),

//Social Studies - American History
  FlashCardData(
      subject: 'Social Studies',
      topic: '1',
      prompt: 'The Civil War was fought from',
      answer: '1861-1865'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '1',
      prompt: 'The Declaration of Independence was signed',
      answer: 'July 4, 1776'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '1',
      prompt: 'Who was the General of the Confederate Army',
      answer: 'Robert E. Lee'),
//Social Studies - World History
  FlashCardData(
      subject: 'Social Studies',
      topic: '2',
      prompt: 'When did the titanic sink',
      answer: 'April 14, 1912'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '2',
      prompt: 'Who discovered electricity',
      answer: 'Benjamin Franklin'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '2',
      prompt: 'Who was the first queen of england',
      answer: 'Mary Tudor'),
//Social Studies - Roman History
  FlashCardData(
      subject: 'Social Studies',
      topic: '3',
      prompt: 'Did the Romans invent the internet',
      answer: 'uh.. No?'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '3',
      prompt: 'What was Roman Shield called',
      answer: 'Scutum'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '3',
      prompt: 'The colosseum could fit how many people',
      answer: '50,000'),
//Social Studies - Geography
  FlashCardData(
      subject: 'Social Studies',
      topic: '4',
      prompt: 'Capital of ecuador',
      answer: 'Quito'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '4',
      prompt: 'What country borders portugal',
      answer: 'Spain'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '4',
      prompt: 'How many continents are there',
      answer: 'There are seven continents'),
//Social Studies - Philosophy
  FlashCardData(
      subject: 'Social Studies',
      topic: '5',
      prompt: 'Who taught plato',
      answer: 'Aristotle'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '5',
      prompt: 'What does philosophy mean',
      answer: 'The study of the fundamental nature of knowledge'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '5',
      prompt: 'What is a red herring fallacy',
      answer: 'Distraction from what the conversation is about'),
//Social Studies - Economics
  FlashCardData(
      subject: 'Social Studies',
      topic: '6',
      prompt: 'Name the three major economic theories',
      answer: 'aissez-faire, Keynesian economics, monetarism'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '6',
      prompt: 'What is Economics',
      answer: 'The branch of knowledge concerned with the transfer of wealth'),
  FlashCardData(
      subject: 'Social Studies',
      topic: '6',
      prompt: 'What is the law of demand',
      answer: 'With higher prices, buyers will demand less'),

//World Languages - Spanish
  FlashCardData(
      subject: 'World Languages',
      topic: '1',
      prompt: 'bread',
      answer: 'un pan'),
  FlashCardData(
      subject: 'World Languages', topic: '1', prompt: 'fox', answer: 'zorro'),
  FlashCardData(
      subject: 'World Languages', topic: '1', prompt: 'woman', answer: 'mujer'),
//World Languages - French
  FlashCardData(
      subject: 'World Languages', topic: '2', prompt: 'bread', answer: 'pain'),
  FlashCardData(
      subject: 'World Languages', topic: '2', prompt: 'fox', answer: 'renarde'),
  FlashCardData(
      subject: 'World Languages', topic: '2', prompt: 'woman', answer: 'femme'),
//World Languages - German
  FlashCardData(
      subject: 'World Languages', topic: '3', prompt: 'bread', answer: 'brot'),
  FlashCardData(
      subject: 'World Languages', topic: '3', prompt: 'fox', answer: 'fuchs'),
  FlashCardData(
      subject: 'World Languages', topic: '3', prompt: 'woman', answer: 'frau'),
//World Languages - Italian
  FlashCardData(
      subject: 'World Languages', topic: '4', prompt: 'bread', answer: 'pane'),
  FlashCardData(
      subject: 'World Languages', topic: '4', prompt: 'fox', answer: 'volpe'),
  FlashCardData(
      subject: 'World Languages', topic: '4', prompt: 'woman', answer: 'donna'),
//World Languages - Russian
  FlashCardData(
      subject: 'World Languages', topic: '5', prompt: 'bread', answer: 'хлеб'),
  FlashCardData(
      subject: 'World Languages', topic: '5', prompt: 'fox', answer: 'лиса'),
  FlashCardData(
      subject: 'World Languages',
      topic: '5',
      prompt: 'woman',
      answer: 'женщина'),
//World Languages - Portuguese
  FlashCardData(
      subject: 'World Languages', topic: '6', prompt: 'bread', answer: 'pão'),
  FlashCardData(
      subject: 'World Languages', topic: '6', prompt: 'fox', answer: 'Raposa'),
  FlashCardData(
      subject: 'World Languages',
      topic: '6',
      prompt: 'woman',
      answer: 'mulher'),
];
