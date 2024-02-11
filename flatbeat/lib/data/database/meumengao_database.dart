import 'package:flatbeat/data/database/entities/partida_entity.dart';
import 'package:flatbeat/data/database/entities/posicao_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MeuMengaoDatabase {
  static Database? _db;

  static const _dbName = "meu_mengao.db";
  static const _dbVersion = 1;

  static Future<Database> get instance async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, _dbName),
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute(PartidaEntity.tableCreationStatement);
        await db.execute(PosicaoEntity.tableCreationStatement);
      },
    );
  }
}
