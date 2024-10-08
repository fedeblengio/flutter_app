import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Color bgColor;

  const Screen({super.key, required this.title, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: bgColor,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
