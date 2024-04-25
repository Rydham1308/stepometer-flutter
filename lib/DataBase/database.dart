import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stepometer/DataBase/db_goalcount/goal_model.dart';

class MyDatabase{
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'pedometer.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }
  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'pedometer.db');
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'pedometer.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }


  Future<List<GoalModel>> getGoalCount() async {
    List<GoalModel> goalList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('select * from tbl_goalsteps');
    for(int i=0; i<data.length; i++)
    {
      GoalModel model = GoalModel();
      model.GoalID = data[i]['goalID'] as int;
      model.GoalCount = data[i]['goalCount'].toString();
      goalList.add(model);
    }
    return goalList;
  }

  Future<void> updateGoalStep({goalID,goalCount})
  async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();
    map['goalCount'] = goalCount;
    await db.update(
        'tbl_goalsteps', map, where: 'goalID = ?', whereArgs: [1]);
    //print(":::${goalCount}:::::${goalID}::::${map['goalCount']}");
  }
}