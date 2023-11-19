import 'package:flatbeat/screens/device_screen.dart';
import 'package:flutter/material.dart';
import 'package:flatbeat/widgets/custom_button.dart';
import 'package:flatbeat/widgets/info_card.dart';
import 'package:flatbeat/utils/constants.dart';
import 'package:flatbeat/utils/utilities.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        backgroundColor: AppColors.primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bluetooth),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeviceScreen()),
              );
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeartRateBanner(),
              MatchInformation(),
              AdditionalInformation(),
              SocialShareSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartRateBanner extends StatefulWidget {
  const HeartRateBanner({Key? key}) : super(key: key);

  @override
  HeartRateBannerState createState() => HeartRateBannerState();
}

class HeartRateBannerState extends State<HeartRateBanner> {
  double _currentSliderValue = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const Text(
            'SEU BATIMENTO NESTA PARTIDA FOI:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('lib/assets/imagens/1231px-Flamengo_heart.svg.png'),
          const Text(
            'FLAMENGO vs. OUTRO TIME',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 200,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
            activeColor: Colors.white,
            inactiveColor: Colors.white30,
          ),
          Text(
            '${_currentSliderValue.round()} BPM',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          // Adicione outras informações como necessário
        ],
      ),
    );
  }
}

class MatchInformation extends StatelessWidget {
  const MatchInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfoCard(
          title: 'Batimentos do 1º Tempo',
          content: 'Detalhes do 1º Tempo aqui...',
          icon: Icons.favorite_border,
        ),
        InfoCard(
          title: 'Batimentos do 2º Tempo',
          content: 'Detalhes do 2º Tempo aqui...',
          icon: Icons.favorite_border,
        ),
        InfoCard(
          title: 'Batimentos do 1º Gol',
          content: 'Detalhes do Gol aqui...',
          icon: Icons.favorite_border,
        ),
      ],
    );
  }
}

class SocialShareSection extends StatelessWidget {
  const SocialShareSection({super.key});

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
