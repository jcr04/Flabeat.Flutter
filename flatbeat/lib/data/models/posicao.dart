// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Posicao {
  Posicao({
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

  final String id;
  final int posicao;
  final String nomeTime;
  final String? escudoTime;
  final String pontos;
  final String jogos;
  final String vitorias;
  final String empates;
  final String derrotas;
  final String golsFeitos;
  final String golsSofridos;
  final String saldoGols;
  final String campeonatoId;
  final String classificacaoName;
  final int classificacaoIndex;

  bool get isCorrupted => nomeTime.isEmpty;

  Posicao copyWith({
    String? id,
    int? posicao,
    String? nomeTime,
    String? escudoTime,
    String? pontos,
    String? jogos,
    String? vitorias,
    String? empates,
    String? derrotas,
    String? golsFeitos,
    String? golsSofridos,
    String? saldoGols,
    String? campeonatoId,
    String? classificacaoName,
    int? classificacaoIndex,
  }) {
    return Posicao(
      id: id ?? this.id,
      posicao: posicao ?? this.posicao,
      nomeTime: nomeTime ?? this.nomeTime,
      escudoTime: escudoTime ?? this.escudoTime,
      pontos: pontos ?? this.pontos,
      jogos: jogos ?? this.jogos,
      vitorias: vitorias ?? this.vitorias,
      empates: empates ?? this.empates,
      derrotas: derrotas ?? this.derrotas,
      golsFeitos: golsFeitos ?? this.golsFeitos,
      golsSofridos: golsSofridos ?? this.golsSofridos,
      saldoGols: saldoGols ?? this.saldoGols,
      campeonatoId: campeonatoId ?? this.campeonatoId,
      classificacaoName: classificacaoName ?? this.classificacaoName,
      classificacaoIndex: classificacaoIndex ?? this.classificacaoIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'posicao': posicao,
      'nome_time': nomeTime,
      'escudo_time': escudoTime,
      'pontos': pontos,
      'jogos': jogos,
      'vitorias': vitorias,
      'empates': empates,
      'derrotas': derrotas,
      'gols_feitos': golsFeitos,
      'gols_sofridos': golsSofridos,
      'saldo_gols': saldoGols,
      'campeonato_id': campeonatoId,
      'classificacao_name': classificacaoName,
      'classificacao_index': classificacaoIndex,
    };
  }

  factory Posicao.fromMap(Map<String, dynamic> map) {
    return Posicao(
      id: map['id'] as String,
      posicao: int.tryParse(map['posicao']) ?? 0,
      nomeTime: map['nome_time'] as String,
      escudoTime:
          map['escudo_time'] != null ? map['escudo_time'] as String : null,
      pontos: map['pontos'] as String,
      jogos: map['jogos'] as String,
      vitorias: map['vitorias'] as String,
      empates: map['empates'] as String,
      derrotas: map['derrotas'] as String,
      golsFeitos: map['gols_feitos'] as String,
      golsSofridos: map['gols_sofridos'] as String,
      saldoGols: map['saldo_gols'] as String,
      campeonatoId: map['campeonato_id'] as String,
      classificacaoName: map['classificacao_name'] as String,
      classificacaoIndex: map['classificacao_index'] as int,
    );
  }

  @override
  String toString() {
    return 'Posicao(id: $id, posicao: $posicao, nomeTime: $nomeTime, escudoTime: $escudoTime, pontos: $pontos, jogos: $jogos, vitorias: $vitorias, empates: $empates, derrotas: $derrotas, golsFeitos: $golsFeitos, golsSofridos: $golsSofridos, saldoGols: $saldoGols, campeonatoId: $campeonatoId, classificacaoName: $classificacaoName, classificacaoIndex: $classificacaoIndex)';
  }

  @override
  bool operator ==(covariant Posicao other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.posicao == posicao &&
        other.nomeTime == nomeTime &&
        other.escudoTime == escudoTime &&
        other.pontos == pontos &&
        other.jogos == jogos &&
        other.vitorias == vitorias &&
        other.empates == empates &&
        other.derrotas == derrotas &&
        other.golsFeitos == golsFeitos &&
        other.golsSofridos == golsSofridos &&
        other.saldoGols == saldoGols &&
        other.campeonatoId == campeonatoId &&
        other.classificacaoName == classificacaoName &&
        other.classificacaoIndex == classificacaoIndex;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        posicao.hashCode ^
        nomeTime.hashCode ^
        escudoTime.hashCode ^
        pontos.hashCode ^
        jogos.hashCode ^
        vitorias.hashCode ^
        empates.hashCode ^
        derrotas.hashCode ^
        golsFeitos.hashCode ^
        golsSofridos.hashCode ^
        saldoGols.hashCode ^
        campeonatoId.hashCode ^
        classificacaoName.hashCode ^
        classificacaoIndex.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory Posicao.fromJson(String source) =>
      Posicao.fromMap(json.decode(source) as Map<String, dynamic>);
}
