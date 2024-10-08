import 'package:flutter/material.dart';

class SelectorList extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Widget nextScreen;

  const SelectorList({
    super.key,
    required this.title,
    required this.bgColor,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextScreen,
          ),
        );
      },
    );
  }
}
