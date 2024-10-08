import 'package:flutter/material.dart';
import '../trans/translations.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String appBarTitle = translations[myLocale.languageCode]?['pokedex'] ?? 'Pokedex';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    );
  }
}
