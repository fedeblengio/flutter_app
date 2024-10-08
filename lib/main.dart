import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/screens/pokedex_screen.dart';
import 'widget/selector_list.dart';
import 'screens/settings_screen.dart';
import 'trans/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'theme/app_theme.dart';
import 'theme/app_state.dart';
import 'screens/wallet_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      locale: appState.locale,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    String appBarTitle = translations[myLocale.languageCode]?['home_title'] ?? 'Pantalla de Inicio';
    String walletTitle = translations[myLocale.languageCode]?['wallet'] ?? 'Billetera';
    String settingsTitle = translations[myLocale.languageCode]?['settings'] ?? 'Configuración';
    String pokedexTitle = translations[myLocale.languageCode]?['pokedex'] ?? 'Pokedex';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SelectorList(
            title: walletTitle,
            bgColor: Theme.of(context).colorScheme.secondary,
            nextScreen: const WalletScreen(),
          ),
          SelectorList(
            title: pokedexTitle,
            bgColor: Theme.of(context).colorScheme.secondary,
            nextScreen: const PokedexScreen(),
          ),
          SelectorList(
            title: settingsTitle,
            bgColor: Theme.of(context).colorScheme.secondary,
            nextScreen: const SettingsScreen(),
          ),
        ],
      ),
    );
  }
}
