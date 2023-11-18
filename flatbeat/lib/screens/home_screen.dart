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

class HeartRateBanner extends StatelessWidget {
  const HeartRateBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/1231px-Flamengo_heart.svg.png'),
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
