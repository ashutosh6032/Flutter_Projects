import 'package:advance_todo_ui/advancetodo.dart';
import 'package:advance_todo_ui/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic listdatabase;

List<ToDo> listdata = [];

class ToDo {
  int? id;
  String title;
  String description;
  String date;
  bool done;

  ToDo(
      {this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.done});

  Map<String, dynamic> mapToDo() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'done': (done) ? 1 : 0
    };
  }

  // @override
  // String toString() {
  //   return '{title:$title,description:$description,date:$date}';
  // }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  listdatabase = openDatabase(
    join(await getDatabasesPath(), "todotable.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE Todocontent1(id INTEGER PRIMARY KEY AUTOINCREMENT ,title TEXT ,description TEXT,date TEXT, done INTEGER)''');
    },
  );

  listdata = await getdata();
  runApp(const MainApp());
}

Future insertintoToDo(ToDo obj) async {
  final localDB = await listdatabase;
  await localDB.insert("Todocontent1", obj.mapToDo(),
      conflictAlgorithm: ConflictAlgorithm.replace);

  listdata = await getdata();
}

Future<List<ToDo>> getdata() async {
  final localDB = await listdatabase;
  List<Map<String, dynamic>> retrievedList =
      await localDB.query("Todocontent1");

  // print(retrievedList[0]);

  return List.generate(retrievedList.length, (i) {
    return ToDo(
      id: retrievedList[i]['id'],
      title: retrievedList[i]['title'],
      description: retrievedList[i]['description'],
      date: retrievedList[i]['date'],
      done: (retrievedList[i]['done'] == 0) ? false : true,
    );
  });
}

//update in database
Future updatedatabase(ToDo obj) async {
  final localDB = await listdatabase;

  localDB.update("Todocontent1", obj.mapToDo(),
      where: 'id  =?', whereArgs: [obj.id]);

  listdata = await getdata();
}

Future<void> deletedata(ToDo obj) async {
  final localDB = await listdatabase;

  await localDB.delete(
    'Todocontent1',
    where: "id=?",
    whereArgs: [obj.id],
  );
  listdata = await getdata();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
