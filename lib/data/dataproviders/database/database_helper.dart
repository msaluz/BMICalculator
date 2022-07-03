import 'dart:io';

import 'package:bmi_calculator/data/models/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'bmi.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bmi(
          id INTEGER PRIMARY KEY,
          username TEXT,
          height INTEGER,
          weight INTEGER,
          score  REAL,
          rating TEXT,
          date DATETIME
      )
      ''');
  }

  Future<List<BMI>> getBmiResults() async {
    Database db = await instance.database;
    var bmiResults = await db.query('bmi', orderBy: 'date');
    List<BMI> groceryList = bmiResults.isNotEmpty
        ? bmiResults.map((c) => BMI.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(BMI bmi) async {
    Database db = await instance.database;
    return await db.insert('bmi', bmi.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('bmi', where: 'id = ?', whereArgs: [id]);
  }
}