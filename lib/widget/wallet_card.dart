import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final Color color;

  const WalletCard({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 120,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
