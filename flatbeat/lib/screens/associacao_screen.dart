import 'package:flatbeat/screens/home_screen.dart';
import 'package:flatbeat/utils/constants.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String matchTitle;

  const MatchDetailsScreen({Key? key, required this.matchTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchTitle),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
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
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MatchInfo(title: 'Horário', detail: '19:00'),
              MatchInfo(title: 'Local', detail: 'Maracanã, Rio de Janeiro'),
              MatchInfo(title: 'Campeonato', detail: 'Campeonato Brasileiro'),
              SizedBox(height: 20),
              GameSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchInfo extends StatelessWidget {
  final String title;
  final String detail;

  const MatchInfo({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            detail,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class AssociacaoScreen extends StatelessWidget {
  const AssociacaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Partida atual',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('Flamengo x OutroTime'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navegar para a tela de detalhes da partida
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MatchDetailsScreen(
                                matchTitle: 'Flamengo x OutroTime'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 118, 117, 117),
                      ),
                      child: const Text('Acessar'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Outras Associações',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: const Text('Flamengo x OutroTime'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Implemente a navegação para detalhes da associação
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
