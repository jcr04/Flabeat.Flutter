import 'package:flutter/material.dart';
import 'package:flatbeat/utils/constants.dart'; // Importe seu arquivo de constantes
import 'screens/home_screen.dart'; // Caminho correto para o arquivo home_screen.dart

void main() {
  runApp(const FlabeatApp());
}

class FlabeatApp extends StatelessWidget {
  const FlabeatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flabeat',
      theme: ThemeData(
        // Utilize as cores definidas nas constantes
        primaryColor: AppColors.primaryColor,
        hintColor: AppColors.accentColor,
        // Configurações adicionais do tema
        useMaterial3: true,
      ),
      // Defina HomeScreen como o widget inicial
      home: const HomeScreen(),
    );
  }
}
