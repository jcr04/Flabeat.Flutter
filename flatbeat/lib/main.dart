import 'package:flatbeat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flatbeat/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HeartRateProvider()),
        // Adicione outros providers aqui, se necessário
      ],
      child: const FlabeatApp(),
    ),
  );
}

class FlabeatApp extends StatelessWidget {
  const FlabeatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flabeat',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        hintColor: AppColors.accentColor,
        // Configurações adicionais do tema
      ),
      home: const HomeScreen(),
    );
  }
}
