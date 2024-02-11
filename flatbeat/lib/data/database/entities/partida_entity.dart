// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flatbeat/data/models/partida.dart';

class PartidaEntity {
  PartidaEntity({
    required this.id,
    required this.campeonato,
    required this.campeonatoId,
    required this.data,
    this.rodadaName,
    this.rodadaIndex,
    required this.timeCasa,
    this.golsCasa,
    required this.timeFora,
    this.golsFora,
    required this.escudoCasa,
    required this.escudoFora,
  });

  final String? id;
  final String? campeonatoId;
  final String? campeonato;
  final String? data;

  final String? rodadaName;
  final int? rodadaIndex;

  final String? timeCasa;
  final int? golsCasa;

  final String? timeFora;
  final int? golsFora;

  final String? escudoCasa;
  final String? escudoFora;

  Partida toPartida() {
    return Partida(
      id: id ?? "",
      campeonato: campeonato ?? "",
      campeonatoId: campeonatoId ?? "",
      data: DateTime.fromMillisecondsSinceEpoch(int.tryParse(data ?? "") ?? 0),
      timeCasa: timeCasa ?? "",
      timeFora: timeFora ?? "",
      golsCasa: golsCasa,
      golsFora: golsFora,
      escudoCasa: escudoCasa ?? "",
      escudoFora: escudoFora ?? "",
      rodadaName: rodadaName,
      rodadaIndex: rodadaIndex,
    );
  }

  factory PartidaEntity.fromPartida(Partida partida) {
    return PartidaEntity(
      id: partida.id,
      campeonato: partida.campeonato,
      campeonatoId: partida.campeonatoId,
      data: partida.data?.millisecondsSinceEpoch.toString() ?? "",
      timeCasa: partida.timeCasa,
      timeFora: partida.timeFora,
      escudoCasa: partida.escudoCasa,
      escudoFora: partida.escudoFora,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idColumn: id,
      campeonatoColumn: campeonato,
      campeonatoIdColumn: campeonatoId,
      dataColumn: data,
      rodadaNameColumn: rodadaName,
      rodadaIndexColumn: rodadaIndex,
      timeCasaColumn: timeCasa,
      golsCasaColumn: golsCasa,
      timeForaColumn: timeFora,
      golsForaColumn: golsFora,
      escudoCasaColumn: escudoCasa,
      escudoForaColumn: escudoFora,
    };
  }

  factory PartidaEntity.fromMap(Map<String, dynamic> map) {
    return PartidaEntity(
      id: map[idColumn] as String,
      campeonato: map[campeonatoColumn] as String,
      campeonatoId: map[campeonatoIdColumn] as String,
      data: map[dataColumn] as String,
      rodadaName: map[rodadaNameColumn] != null
          ? map[rodadaNameColumn] as String
          : null,
      rodadaIndex: map[rodadaIndexColumn] as int?,
      timeCasa: map[timeCasaColumn] as String,
      golsCasa: int.tryParse(map[golsCasaColumn]),
      timeFora: map[timeForaColumn] as String,
      golsFora: int.tryParse(map[golsForaColumn]),
      escudoCasa: map[escudoCasaColumn] as String,
      escudoFora: map[escudoForaColumn] as String,
    );
  }

  static const idColumn = "id";
  static const dataColumn = "data";
  static const timeCasaColumn = "timeCasa";
  static const timeForaColumn = "timeFora";
  static const escudoCasaColumn = "escudoCasa";
  static const escudoForaColumn = "escudoFora";
  static const golsCasaColumn = "golsCasa";
  static const golsForaColumn = "golsFora";
  static const campeonatoColumn = "campeonato";
  static const campeonatoIdColumn = "campeonatoId";
  static const rodadaNameColumn = "rodadaName";
  static const rodadaIndexColumn = "rodadaIndex";

  static const tableName = "partidas";
  static const tableCreationStatement = """
  CREATE TABLE $tableName(
    $idColumn VARCHAR(255) PRIMARY KEY, 
    $dataColumn VARCHAR(255), 
    $timeCasaColumn VARCHAR(255), 
    $timeForaColumn VARCHAR(255), 
    $escudoCasaColumn TEXT,
    $escudoForaColumn TEXT,
    $golsCasaColumn VARCHAR(255), 
    $golsForaColumn VARCHAR(255), 
    $campeonatoColumn VARCHAR(255), 
    $campeonatoIdColumn VARCHAR(255), 
    $rodadaNameColumn VARCHAR(255), 
    $rodadaIndexColumn INT(11))
  """;
}
