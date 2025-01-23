import 'package:sqflite/sqflite.dart';
import 'package:todo_app/feathers/home/data/model/task_model.dart';

class SqfliteHelper {
  late Database dbs;
  void initDb() async {
    await openDatabase(
      'tasks_db',
      version: 1,
      onCreate: (Database db, version) async {
        return await db.execute('''
           CREATE TABLE Tasks(
           id INTEGER PRIMARY KEY AUTOINCREMENT ,
           title TEXT,
           note TEXT,
           date TEXT,
           startTime TEXT,
           endTime TEXT,
           color INTEGER,
           isCompleted INTEGER

              )

         ''').then((value) => print('Database created'));
      },
      onOpen: (db) => print('Database opened'),
    ).then((value) => dbs = value);
  }

  Future<List<Map<String, Object?>>> getFromDb() async {
    return await dbs.rawQuery('SELECT * FROM Tasks');
  }

  Future<int> insertIntoDb(TaskModel model) async {
    return await dbs.rawInsert('''
      INSERT INTO Tasks(
      title,note,date,startTime,endTime,color,isCompleted
      )
      VALUES
      ('${model.title}','${model.body}','${model.date}','${model.startTime}','${model.endTime}','${model.color}','${model.isCompelet}')
''');
  }

  Future<int> updatedDb(int id) async {
    return await dbs.rawUpdate('''
     UPDATE Tasks
     SET isCompleted= ?
     WHERE id = ?
   ''', [1, id]);
  }

  Future<int> deleteFromDb(int id) async {
    return await dbs.rawDelete('''
DELETE FROM Tasks WHERE id =?

''',[id]);
  }
}
