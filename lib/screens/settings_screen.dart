import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_state.dart';
import '../trans/translations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    Locale myLocale = Localizations.localeOf(context);

    String title = translations[myLocale.languageCode]?['settings_title'] ?? 'Configuración';
    String darkModeText = translations[myLocale.languageCode]?['dark_mode'] ?? 'Modo oscuro';
    String languageText = translations[myLocale.languageCode]?['language'] ?? 'Idioma';
    String englishText = translations[myLocale.languageCode]?['english'] ?? 'Inglés';
    String spanishText = translations[myLocale.languageCode]?['spanish'] ?? 'Español';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(darkModeText),
                Switch(
                  value: appState.isDarkMode,
                  onChanged: (value) {
                    appState.toggleDarkMode();
                  },
                ),
              ],
            ),
            const Divider(),
            Text(languageText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appState.locale.languageCode == 'en' ? englishText : spanishText),
                DropdownButton<String>(
                  value: appState.locale.languageCode,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(englishText),
                    ),
                    DropdownMenuItem(
                      value: 'es',
                      child: Text(spanishText),
                    ),
                  ],
                  onChanged: (String? newLanguage) {
                    if (newLanguage != null) {
                      appState.setLocale(Locale(newLanguage));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
