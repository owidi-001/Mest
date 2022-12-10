import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Create tables
  static Future<void> createTables(sql.Database database) async {
    const String query = """ CREATE TABLE menu(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      image TEXT,
      description TEXT,
      created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) """;
    await database.execute(query);
  }

  // db
  static Future<sql.Database> db() async {
    return sql.openDatabase("mest.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  // Create new item
  static Future<int> createItem(
      String? image, String? name, String? description) async {
    final db = await SQLHelper.db();

    final data = {"name": name, "image": image, "description": description};

    final id = await db.insert("menu", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // read all items
  static Future<List<Map<String, dynamic>>> getMenu() async {
    final db = await SQLHelper.db();

    return db.query("menu", orderBy: "id");
  }

  // get one item
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();

    return db.query("menu", where: "id = ?", whereArgs: [id], limit: 1);
  }

  // update item
  static Future<int> updateItem(
      int id, String? name, String? description) async {
    final db = await SQLHelper.db();

    final data = {"name": name, "description": description};

    final result =
        await db.update("menu", data, where: "id = ?", whereArgs: [id]);

    return result;
  }

  // delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();

    try {
      await db.delete("menu", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Something went wrong when deleting $e");
    }
  }
}
