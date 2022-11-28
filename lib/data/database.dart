// ignore_for_file: depend_on_referenced_packages

import 'package:mobflix/data/video_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'video.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(VideoDao.tableSql);
  }, version: 1);
}


