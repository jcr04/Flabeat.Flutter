import 'package:flatbeat/screens/associacao_screen.dart';
import 'package:flutter/material.dart';
import 'package:flatbeat/screens/device_screen.dart';
import 'package:flatbeat/widgets/custom_button.dart';
import 'package:flatbeat/widgets/info_card.dart';
import 'package:flatbeat/utils/constants.dart';
import 'package:flatbeat/utils/utilities.dart';
import 'package:flatbeat/screens/perfil_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flatbeat/service/api_service.dart';
import 'package:flatbeat/data/models/partida.dart';
import 'package:flatbeat/providers/heart_rate_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class ProximaPartidaNotifier extends StateNotifier<AsyncValue<Partida?>> {
  ProximaPartidaNotifier(this.ref) : super(const AsyncValue.loading()) {
    _fetchProximaPartida();
  }

  final Ref ref;
  final proximaPartidaProvider =
      StateNotifierProvider<ProximaPartidaNotifier, AsyncValue<Partida?>>(
          (ref) {
    return ProximaPartidaNotifier(ref.read as Ref<Object?>);
  });

  Future<void> _fetchProximaPartida() async {
    try {
      final partida = await ref.read(apiServiceProvider).getProximaPartida();
      state = AsyncValue.data(partida);
    } catch (e) {
      state = AsyncValue.error(
          e, StackTrace.current); // Adicione StackTrace.current
    }
  }
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
      length: 3,
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
              HomeContent(),
              AssociacaoScreen(),
              PerfilScreen(),
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
    return SingleChildScrollView(
      // Isso permite que a coluna seja rolável
      child: Container(
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
        child: Column(
          children: [
            const HeartRateBanner(),
            const GameSection(),
            const MatchInformation(),
            const AdditionalInformation(),
            const SocialShareSection(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}

class GameSection extends ConsumerWidget {
  const GameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partidaAsyncValue = ref.watch(proximaPartidaProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: partidaAsyncValue.when(
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Erro: $err'),
            data: (partida) {
              if (partida == null) {
                return const Text('Nenhuma partida encontrada');
              }
              return Column(
                children: [
                  Text(
                    '${partida.timeCasa} vs ${partida.timeFora}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.sports_soccer, color: Colors.white),
                      Text(
                        " ${partida.golsCasa ?? '_'} x ${partida.golsFora ?? '_'} ",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 24.0),
                      ),
                      const Icon(Icons.sports_soccer, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar navegação para a tela de histórico
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Acesse seu histórico'),
                  ),
                ],
              );
            },
          ),
        ),
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
    final heartRate = ref.watch(heartRateProvider);
    return Column(
      children: [
        Image.asset('lib/assets/imagens/1231px-Flamengo_heart.svg.png'),
        Slider(
          value: heartRate,
          min: 0,
          max: 200,
          divisions: 100,
          label: heartRate.round().toString(),
          onChanged: (value) =>
              ref.read(heartRateProvider.notifier).updateHeartRate(value),
          activeColor: const Color.fromARGB(255, 248, 239, 239),
          inactiveColor: const Color.fromARGB(77, 39, 2, 2),
        ),
        Text(
          '$heartRate BPM',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class MatchInformation extends StatelessWidget {
  const MatchInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomButton(
            text: 'Compartilhar',
            onPressed: () {
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
