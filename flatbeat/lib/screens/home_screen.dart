import 'package:flutter/material.dart';
// Importe outros pacotes necessários aqui, como para o compartilhamento em redes sociais

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flabeat'),
        // Configurações adicionais do AppBar, se necessário
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeartRateBanner(),
              MatchInformation(),
              AdditionalInformation(),
              SocialShareSection(),
              // Outras seções conforme necessário
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
          // Restante dos componentes do banner
        ],
      ),
    );
  }
}

class MatchInformation extends StatelessWidget {
  const MatchInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Estilização e conteúdo da seção de informações da partida
        );
  }
}

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Estilização e conteúdo da seção de informações adicionais
        );
  }
}

class SocialShareSection extends StatelessWidget {
  const SocialShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // Estilização e conteúdo da seção de compartilhamento social
        );
  }
}

// Defina outros widgets que você precisar aqui
