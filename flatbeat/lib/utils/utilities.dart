import 'package:flutter/material.dart';
// Importe pacotes adicionais conforme necessário

class Utilities {
  // Exemplo de função para formatação de data
  static String formatDate(DateTime date) {
    // Implemente a lógica de formatação de data aqui
    return 'Formatada: ${date.toIso8601String()}'; // Substitua pela sua lógica
  }

  // Exemplo de função para mostrar um Snackbar
  static void showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // Adicione mais funções de utilidade conforme necessário
}
