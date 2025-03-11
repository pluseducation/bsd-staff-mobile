import 'package:bst_staff_mobile/data/database/entity/login-db-entity.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseVersion = 2;

  static const _databaseName = 'com.osnarc.antidrug.db';

  static const loginTableName = 'login';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createLoginTableV1(batch);
        await batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        final batch = db.batch();
        if (oldVersion < databaseVersion) {
          _createLoginTableV1(batch);
        }
        await batch.commit();
      },
      version: databaseVersion,
    );
  }

  void _createLoginTableV1(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE $loginTableName(
      ${LoginDbEntity.fieldId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${LoginDbEntity.fieldUsername} TEXT NOT NULL,
      ${LoginDbEntity.fieldPin} TEXT NOT NULL
      );
      ''',
    );
  }

  // void _createMoviesTableV1(Batch batch) {
  //   batch.execute(
  //     '''
  //     CREATE TABLE $moviesTableName(
  //     ${MovieDbEntity.fieldId} INTEGER PRIMARY KEY AUTOINCREMENT,
  //     ${MovieDbEntity.fieldMovieId} TEXT NOT NULL,
  //     ${MovieDbEntity.fieldTitle} TEXT NOT NULL,
  //     ${MovieDbEntity.fieldImageUrl} TEXT NULL,
  //     ${MovieDbEntity.fieldReleaseDate} INTEGER NOT NULL
  //     );
  //     ''',
  //   );
  // }
}
