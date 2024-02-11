// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flatbeat/data/models/posicao.dart';

class PosicaoEntity {
  PosicaoEntity({
    required this.id,
    required this.posicao,
    required this.nomeTime,
    this.escudoTime,
    required this.pontos,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.golsFeitos,
    required this.golsSofridos,
    required this.saldoGols,
    required this.campeonatoId,
    required this.classificacaoName,
    required this.classificacaoIndex,
  });

  final String? id;
  final int? posicao;
  final String? nomeTime;
  final String? escudoTime;
  final String? pontos;
  final String? jogos;
  final String? vitorias;
  final String? empates;
  final String? derrotas;
  final String? golsFeitos;
  final String? golsSofridos;
  final String? saldoGols;
  final String? campeonatoId;
  final String? classificacaoName;
  final int? classificacaoIndex;

  Posicao toPosicao() {
    return Posicao(
      id: id ?? "",
      posicao: posicao ?? 0,
      nomeTime: nomeTime ?? "",
      pontos: pontos ?? "",
      jogos: jogos ?? "",
      vitorias: vitorias ?? "",
      empates: empates ?? "",
      derrotas: derrotas ?? "",
      golsFeitos: golsFeitos ?? "",
      golsSofridos: golsSofridos ?? "",
      saldoGols: saldoGols ?? "",
      escudoTime: escudoTime,
      campeonatoId: campeonatoId ?? "",
      classificacaoName: classificacaoName ?? "",
      classificacaoIndex: classificacaoIndex ?? 0,
    );
  }

  factory PosicaoEntity.fromPosicao(Posicao posicao) {
    return PosicaoEntity(
      id: posicao.id,
      posicao: posicao.posicao,
      nomeTime: posicao.nomeTime,
      pontos: posicao.pontos,
      jogos: posicao.jogos,
      vitorias: posicao.vitorias,
      empates: posicao.empates,
      derrotas: posicao.derrotas,
      golsFeitos: posicao.golsFeitos,
      golsSofridos: posicao.golsSofridos,
      saldoGols: posicao.saldoGols,
      escudoTime: posicao.escudoTime,
      campeonatoId: posicao.campeonatoId,
      classificacaoName: posicao.classificacaoName,
      classificacaoIndex: posicao.classificacaoIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idColumn: id,
      posicaoColumn: posicao,
      nomeTimeColumn: nomeTime,
      escudoTimeColumn: escudoTime,
      pontosColumn: pontos,
      jogosColumn: jogos,
      vitoriasColumn: vitorias,
      empatesColumn: empates,
      derrotasColumn: derrotas,
      golsFeitosColumn: golsFeitos,
      golsSofridosColumn: golsSofridos,
      saldoGolsColumn: saldoGols,
      campeonatoIdColumn: campeonatoId,
      classificacaoNameColumn: classificacaoName,
      classificacaoIndexColumn: classificacaoIndex,
    };
  }

  factory PosicaoEntity.fromMap(Map<String, dynamic> map) {
    return PosicaoEntity(
      id: map[idColumn] as String,
      posicao: int.tryParse(map[posicaoColumn]) ?? 0,
      nomeTime: map[nomeTimeColumn] as String,
      escudoTime: map[escudoTimeColumn] != null
          ? map[escudoTimeColumn] as String
          : null,
      pontos: map[pontosColumn] as String,
      jogos: map[jogosColumn] as String,
      vitorias: map[vitoriasColumn] as String,
      empates: map[empatesColumn] as String,
      derrotas: map[derrotasColumn] as String,
      golsFeitos: map[golsFeitosColumn] as String,
      golsSofridos: map[golsSofridosColumn] as String,
      saldoGols: map[saldoGolsColumn] as String,
      campeonatoId: map[campeonatoIdColumn] as String,
      classificacaoName: map[classificacaoNameColumn] as String,
      classificacaoIndex: map[classificacaoIndexColumn] as int,
    );
  }

  static const idColumn = "id";
  static const posicaoColumn = "posicao";
  static const nomeTimeColumn = "nomeTime";
  static const escudoTimeColumn = "escudoTime";
  static const pontosColumn = "pontos";
  static const jogosColumn = "jogos";
  static const vitoriasColumn = "vitorias";
  static const empatesColumn = "empates";
  static const derrotasColumn = "derrotas";
  static const golsFeitosColumn = "golsFeitos";
  static const golsSofridosColumn = "golsSofridos";
  static const saldoGolsColumn = "saldoGols";
  static const campeonatoIdColumn = "campeonatoId";
  static const classificacaoNameColumn = "classificacaoName";
  static const classificacaoIndexColumn = "classificacaoIndex";

  static const tableName = "posicao";
  static const tableCreationStatement = """
  CREATE TABLE $tableName(
    $idColumn VARCHAR(255) PRIMARY KEY, 
    $posicaoColumn VARCHAR(255), 
    $nomeTimeColumn VARCHAR(255), 
    $escudoTimeColumn TEXT,
    $pontosColumn VARCHAR(255), 
    $jogosColumn VARCHAR(255), 
    $vitoriasColumn VARCHAR(255), 
    $empatesColumn VARCHAR(255), 
    $derrotasColumn VARCHAR(255), 
    $golsFeitosColumn VARCHAR(255), 
    $golsSofridosColumn VARCHAR(255), 
    $saldoGolsColumn VARCHAR(255), 
    $campeonatoIdColumn VARCHAR(255), 
    $classificacaoNameColumn VARCHAR(255), 
    $classificacaoIndexColumn INT(11))
  """;
}
