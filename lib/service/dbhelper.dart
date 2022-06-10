import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper{
  // Create table
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        storeId TEXT,
        storeCode TEXT,
        storeName TEXT,
        address TEXT,
        dcId TEXT,
        dcName TEXT,
        accountId TEXT,
        accountName TEXT,
        subchannelId TEXT,
        subchannelName TEXT,
        channelId TEXT,
        channelName TEXT,
        areaId TEXT,
        areaName TEXT,
        regionId TEXT,
        regionName TEXT,
        latitude TEXT,
        longitude TEXT,
        visit INTEGER
      )
      """);
  }
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'stores.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Add item
  static Future<int> createItem(
      String storeId ,
      String storeCode,
      String storeName,
      String address,
      String dcId,
      String dcName,
      String accountId,
      String accountName,
      String subchannelId,
      String subchannelName,
      String channelId,
      String channelName,
      String areaId,
      String areaName,
      String regionId,
      String regionName,
      String latitude,
      String longitude,
      int visit)
  async {
    final db = await SQLHelper.db();

    final data = {
      'storeId':storeId,
      'storeCode':storeCode,
      'storeName':storeName,
      'address':address,
      'dcId':dcId,
      'dcName':dcName,
      'accountId':accountId,
      'accountName':accountName,
      'subchannelId':subchannelId,
      'subchannelName':subchannelName,
      'channelId':channelId,
      'channelName':channelName,
      'areaId':areaId,
      'areaName':areaName,
      'regionId':regionId,
      'latitude':latitude,
      'longitude':longitude,
      'visit':visit

    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Get allitem
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }
 //Get item by id
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }
 //Update Item
  static Future<int> updateItem(int id, int visit)
  async {
    final db = await SQLHelper.db();

    final data = {
      'visit':visit
    };
    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  
  // Future<int> update(stores todo) async {
  //   return await db.update(tableTodo, todo.toMap(),
  //       where: '$columnId = ?', whereArgs: [todo.id]);
  // }
}