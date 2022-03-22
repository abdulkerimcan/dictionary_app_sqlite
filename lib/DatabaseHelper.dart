import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String databaseName = "dictionary.sqlite";

  static Future<Database> databaseAccess() async {
    String databasePath = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(databasePath)) {
      print("Database already exists");
    } else {
      ByteData data = await rootBundle.load("database/$databaseName");

      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Database has been copied.");
    }
    return openDatabase(databasePath);
  }
}