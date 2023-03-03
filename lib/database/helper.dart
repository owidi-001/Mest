import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Create tables
  static Future<void> createTables(sql.Database database) async {
    const String query = """ CREATE TABLE menu(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name VARCHAR(100),
      image TEXT,
      description VARCHAR(255),
      created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ),
    CREATE TABLE menu(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name VARCHAR(100),
      image TEXT,
      description VARCHAR(255),
      created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ),
    
     """;
    await database.execute(query);
  }

  // db
  static Future<sql.Database> db() async {
    return sql.openDatabase("mest.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }
}
