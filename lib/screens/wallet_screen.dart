import 'package:flutter/material.dart';
import '../widget/wallet_card.dart';
import '../trans/translations.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String appBarTitle = translations[myLocale.languageCode]?['wallet'] ?? 'Billetera';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WalletCard(title: 'MASTERCARD', color: Colors.blue),
            WalletCard(title: 'VISA', color: Colors.red),
            WalletCard(title: 'AMERICAN EXPRESS', color: Colors.amber),
            WalletCard(title: 'Apple Cash', color: Colors.black),
          ],
        ),
      ),
    );
  }
}
