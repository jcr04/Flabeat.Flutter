import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flatbeat/screens/device_screen.dart';
import 'package:flatbeat/widgets/custom_button.dart';
import 'package:flatbeat/widgets/info_card.dart';
import 'package:flatbeat/utils/constants.dart';
import 'package:flatbeat/utils/utilities.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HeartRateProvider()),
        // Outros providers vão aqui
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flabeat',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appTitle),
          backgroundColor: AppColors.primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.bluetooth),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DeviceScreen()),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'HISTÓRICO'),
              Tab(text: 'ASSOCIAÇÃO'),
              Tab(text: 'PERFIL'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              SingleChildScrollView(child: HomeContent()),
              // Substitua pelos widgets de conteúdo de cada aba
              Center(child: Text('ASSOCIAÇÃO')),
              Center(child: Text('PERFIL')),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Envolve os widgets em um Container com decoração de gradiente
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red, // Cor vermelha oficial do Flamengo
            Colors.black, // Cor preta oficial do Flamengo
          ],
        ),
      ),
      child: const Column(
        children: [
          HeartRateBanner(),
          MatchInformation(),
          AdditionalInformation(),
          SocialShareSection(),
        ],
      ),
    );
  }
}

class HeartRateProvider with ChangeNotifier {
  double _currentHeartRate = 60;

  double get currentHeartRate => _currentHeartRate;

  void updateHeartRate(double newRate) {
    if (_currentHeartRate != newRate) {
      _currentHeartRate = newRate;
      notifyListeners();
    }
  }
}

class HeartRateBanner extends StatelessWidget {
  const HeartRateBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heartRateProvider = Provider.of<HeartRateProvider>(context);
    return Column(
      children: [
        Image.asset('lib/assets/imagens/1231px-Flamengo_heart.svg.png'),
        Slider(
          value: heartRateProvider.currentHeartRate,
          min: 0,
          max: 200,
          divisions: 100,
          label: heartRateProvider.currentHeartRate.round().toString(),
          onChanged: (double value) {
            heartRateProvider.updateHeartRate(value);
          },
          activeColor: const Color.fromARGB(255, 248, 239, 239),
          inactiveColor: const Color.fromARGB(77, 39, 2, 2),
        ),
        Text(
          '${heartRateProvider.currentHeartRate.round()} BPM',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        // Outros widgets...
      ],
    );
  }
}

class MatchInformation extends StatelessWidget {
  const MatchInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se houver lógica para buscar os dados, mova para um provedor
    return Container(
        // Implementação da UI
        );
  }
}

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Info> infoData = [
      Info(
          title: 'Batimentos do 1º Tempo',
          content: 'Detalhes do 1º Tempo aqui...'),
      Info(
          title: 'Batimentos do 2º Tempo',
          content: 'Detalhes do 2º Tempo aqui...'),
      Info(title: 'Batimentos do 1º Gol', content: 'Detalhes do Gol aqui...'),
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: infoData.length,
      itemBuilder: (context, index) {
        return InfoCard(info: infoData[index]);
      },
    );
  }
}

class Info {
  final String title;
  final String content;

  Info({required this.title, required this.content});
}

class SocialShareSection extends StatelessWidget {
  const SocialShareSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se a ação de compartilhar envolve lógica de negócios, mova para um provedor
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomButton(
            text: 'Compartilhar',
            onPressed: () {
              // Considerar movendo a lógica de 'showSnackbar' para um provedor se mais complexo
              Utilities.showSnackbar(context, 'Compartilhando...');
            },
            color: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
