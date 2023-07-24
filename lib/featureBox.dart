import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String header;
  final String decription;
  final Color color;
  const FeatureBox({
    super.key,
    required this.header,
    required this.decription,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ).copyWith(
        left: 20,
        right: 40,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Cera Pro',
            ),
          ),
          Text(
            decription,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
