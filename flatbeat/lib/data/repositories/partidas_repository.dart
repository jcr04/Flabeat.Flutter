import 'package:flatbeat/data/database/meumengao_database.dart';
import 'package:flatbeat/service/api_service.dart';
import 'package:flutter/foundation.dart';

import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/partida_entity.dart';
import '../models/partida.dart';

abstract class PartidasRepository {
  Future<Partida?> getProximaPartida();

  Future<List<Partida>> getResultados();

  Future<List<Partida>> getCalendario();

  Future<List<Partida>> getRodadas(String campeonatoId);
}

class PartidasRepositoryImpl extends PartidasRepository {
  PartidasRepositoryImpl(this._api);
  final ApiService _api;

  Future<Database> get _database async => MeuMengaoDatabase.instance;

  @override
  Future<Partida?> getProximaPartida() async {
    final receivedPartida = await _api.getProximaPartida();
    try {
      final db = await _database;

      if (receivedPartida != null) {
        await db.insert(
          PartidaEntity.tableName,
          PartidaEntity.fromPartida(receivedPartida).toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        return receivedPartida;
      }

      final savedPartidaMap = await db.query(
        PartidaEntity.tableName,
        where: '${PartidaEntity.dataColumn} >= ?',
        whereArgs: [DateTime.now().millisecondsSinceEpoch.toString()],
        orderBy: "${PartidaEntity.dataColumn} ASC",
      );
      final savedPartida =
          savedPartidaMap.map((e) => PartidaEntity.fromMap(e).toPartida());
      return savedPartida.toList().first;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return receivedPartida;
    }
  }

  @override
  Future<List<Partida>> getResultados() async {
    final receivedPartidas = await _api.getResultados() ?? [];
    try {
      final db = await _database;
      final batch = db.batch();

      if (receivedPartidas.isNotEmpty) {
        for (var partida in receivedPartidas) {
          batch.insert(
            PartidaEntity.tableName,
            PartidaEntity.fromPartida(partida).toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        await batch.commit(noResult: true);

        return receivedPartidas;
      }

      final savedPartidaMap = await db.query(
        PartidaEntity.tableName,
        where: '${PartidaEntity.dataColumn} < ?',
        whereArgs: [DateTime.now().millisecondsSinceEpoch.toString()],
        orderBy: "${PartidaEntity.dataColumn} DESC",
      );
      final savedPartidas =
          savedPartidaMap.map((e) => PartidaEntity.fromMap(e).toPartida());
      return savedPartidas.toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return receivedPartidas;
    }
  }

  @override
  Future<List<Partida>> getCalendario() async {
    final receivedPartidas = await _api.getCalendario() ?? [];
    try {
      final db = await _database;
      final batch = db.batch();

      if (receivedPartidas.isNotEmpty) {
        for (var partida in receivedPartidas) {
          batch.insert(
            PartidaEntity.tableName,
            PartidaEntity.fromPartida(partida).toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        await batch.commit(noResult: true);

        return receivedPartidas;
      }

      final savedPartidaMap = await db.query(
        PartidaEntity.tableName,
        where: '${PartidaEntity.dataColumn} >= ?',
        whereArgs: [DateTime.now().millisecondsSinceEpoch.toString()],
        orderBy: "${PartidaEntity.dataColumn} DESC",
      );
      final savedPartidas =
          savedPartidaMap.map((e) => PartidaEntity.fromMap(e).toPartida());
      return savedPartidas.toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return receivedPartidas;
    }
  }

  @override
  Future<List<Partida>> getRodadas(String campeonatoId) async {
    final receivedPartidas = await _api.getRodadas(campeonatoId) ?? [];
    try {
      final db = await _database;
      final batch = db.batch();

      if (receivedPartidas.isNotEmpty) {
        for (var partida in receivedPartidas) {
          batch.insert(
            PartidaEntity.tableName,
            PartidaEntity.fromPartida(partida).toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        await batch.commit(noResult: true);

        return receivedPartidas;
      }

      final savedPartidaMap = await db.query(
        PartidaEntity.tableName,
        where: '${PartidaEntity.campeonatoIdColumn} = ?',
        whereArgs: [campeonatoId],
      );
      final savedPartidas =
          savedPartidaMap.map((e) => PartidaEntity.fromMap(e).toPartida());
      return savedPartidas.toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return receivedPartidas;
    }
  }
}

final partidasRepositoryProvider = Provider<PartidasRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return PartidasRepositoryImpl(apiService);
});
