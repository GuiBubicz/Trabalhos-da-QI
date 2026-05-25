import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/frase_model.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance =
      DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {

  String path = join(
    await getDatabasesPath(),
    'toque_fale.db',
  );

  return await openDatabase(

    path,

    version: 1,

    onCreate: _onCreate,
  );
}

  Future<void> _onCreate(
    Database db,
    int version,
  ) async {

    await db.execute('''
      CREATE TABLE frases(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        texto TEXT,
        icone INTEGER,
        cor INTEGER
      )
    ''');

    await _inserirFrasesIniciais(db);
  }

  Future<void> _inserirFrasesIniciais(
    Database db,
  ) async {

    final frases = [

      {
        'texto': 'Quero Água',
        'icone':
            Icons.local_drink.codePoint,
        'cor': Colors.blue.value,
      },

      {
        'texto': 'Tenho Dor',
        'icone':
            Icons.healing.codePoint,
        'cor': Colors.red.value,
      },

      {
        'texto': 'Banheiro',
        'icone':
            Icons.wc.codePoint,
        'cor': Colors.green.value,
      },

      {
        'texto': 'Ajuda',
        'icone':
            Icons.sos.codePoint,
        'cor': Colors.orange.value,
      },

      {
        'texto': 'Quero Comer',
        'icone':
            Icons.restaurant.codePoint,
        'cor': Colors.purple.value,
      },

      {
        'texto': 'Quero Dormir',
        'icone':
            Icons.bed.codePoint,
        'cor': Colors.teal.value,
      },

      {
        'texto': 'Estou Feliz',
        'icone':
            Icons.favorite.codePoint,
        'cor': Colors.pink.value,
      },

    ];

    for (var frase in frases) {

      await db.insert(
        'frases',
        frase,
      );
    }
  }

  Future<int> inserirFrase(
    FraseModel frase,
  ) async {

    final db = await database;

    return await db.insert(
      'frases',
      frase.toMap(),
    );
  }

  Future<List<FraseModel>>
      listarFrases() async {

    final db = await database;

    final List<Map<String, dynamic>>
        maps = await db.query('frases');

    return maps.map((map) {

      return FraseModel.fromMap(map);

    }).toList();
  }

  Future<int> atualizarFrase(
    FraseModel frase,
  ) async {

    final db = await database;

    return await db.update(

      'frases',

      frase.toMap(),

      where: 'id = ?',

      whereArgs: [frase.id],
    );
  }

  Future<int> deletarFrase(
    int id,
  ) async {

    final db = await database;

    return await db.delete(

      'frases',

      where: 'id = ?',

      whereArgs: [id],
    );
  }
}