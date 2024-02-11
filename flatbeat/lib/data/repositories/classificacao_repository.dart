import 'package:flatbeat/data/database/entities/posicao_entity.dart';
import 'package:flatbeat/data/database/meumengao_database.dart';
import 'package:flatbeat/data/models/posicao.dart';
import 'package:flatbeat/service/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ClassificacaoRepository {
  Future<List<Posicao>> getWithCampeonatoId(String campeonatoId);
}

class ClassificacaoRepositoryImpl extends ClassificacaoRepository {
  ClassificacaoRepositoryImpl(this._api);
  final ApiService _api;

  Future<Database> get _database async => MeuMengaoDatabase.instance;

  @override
  Future<List<Posicao>> getWithCampeonatoId(String campeonatoId) async {
    final receivedClassificacao =
        await _api.getClassificacao(campeonatoId) ?? [];
    try {
      final db = await _database;
      final batch = db.batch();

      if (receivedClassificacao.isNotEmpty) {
        for (var posicao in receivedClassificacao) {
          batch.insert(
            PosicaoEntity.tableName,
            PosicaoEntity.fromPosicao(posicao).toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        await batch.commit(noResult: true);

        return receivedClassificacao;
      }

      final savedClassificacaoMap = await db.query(
        PosicaoEntity.tableName,
        where: '${PosicaoEntity.campeonatoIdColumn} = ?',
        whereArgs: [campeonatoId],
      );
      final savedClassificacao = savedClassificacaoMap
          .map((e) => PosicaoEntity.fromMap(e).toPosicao());

      return savedClassificacao.toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return receivedClassificacao;
    }
  }
}

final classificacaoRepositoryProvider =
    Provider<ClassificacaoRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ClassificacaoRepositoryImpl(apiService);
});
