import 'package:flutter/material.dart';

class Utilities {
  static String formatDate(DateTime date) {
    return 'Formatada: ${date.toIso8601String()}'; // Substitua pela sua lógica
  }

  static void showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
