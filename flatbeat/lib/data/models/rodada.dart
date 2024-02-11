// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rodada {
  Rodada({
    required this.nome,
    required this.index,
  });

  String nome;
  int index;

  Rodada copyWith({
    String? nome,
    int? index,
  }) {
    return Rodada(
      nome: nome ?? this.nome,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'index': index,
    };
  }

  factory Rodada.fromMap(Map<String, dynamic> map) {
    return Rodada(
      nome: map['nome'] as String,
      index: map['index'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rodada.fromJson(String source) =>
      Rodada.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rodada(nome: $nome, index: $index)';

  @override
  bool operator ==(covariant Rodada other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.index == index;
  }

  @override
  int get hashCode => nome.hashCode ^ index.hashCode;
}
