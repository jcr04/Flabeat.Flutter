import 'dart:convert';

import 'package:flatbeat/data/models/partida.dart';
import 'package:flatbeat/data/models/posicao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class ApiService {
  Future<Partida?> getProximaPartida();
  Future<List<Partida>?> getResultados();
  Future<List<Partida>?> getCalendario();
  Future<List<Posicao>?> getClassificacao(String campeonatoId);
  Future<List<Partida>?> getRodadas(String campeonatoId);
}

class ApiServiceImpl extends ApiService {
  @override
  Future<Partida?> getProximaPartida() async {
    return _getData("partidas/proxima", (response) {
      return Partida.fromJson(response.body);
    });
  }

  @override
  Future<List<Partida>?> getResultados() async {
    return _getData("partidas/resultados", (response) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Partida.fromMap(e)).toList();
    });
  }

  @override
  Future<List<Partida>?> getCalendario() async {
    return _getData("partidas/calendario", (response) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Partida.fromMap(e)).toList();
    });
  }

  @override
  Future<List<Posicao>?> getClassificacao(String campeonatoId) async {
    return _getData("posicao/campeonato/$campeonatoId", (response) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Posicao.fromMap(e)).toList();
    });
  }

  @override
  Future<List<Partida>?> getRodadas(String campeonatoId) async {
    return _getData("partidas/campeonato/$campeonatoId", (response) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Partida.fromMap(e)).toList();
    });
  }

  Future<T?> _getData<T>(
    String endpoint,
    T Function(Response response) parseResponse,
  ) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      final url = Uri.parse("$baseUrl$endpoint");
      final response = await http.get(url);
      return response.statusCode == 200 ? parseResponse(response) : null;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }
      return null;
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiServiceImpl();
});
