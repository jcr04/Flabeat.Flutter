import 'package:flatbeat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flatbeat/utils/constants.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  const InfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        leading: const Icon(Icons.favorite, size: 28, color: Colors.white),
        title: Text(
          info.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              info.content,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
