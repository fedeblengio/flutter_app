import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/pokedex/pokedex_bloc.dart';
import '/bloc/pokedex/pokedex_event.dart';
import '/bloc/pokedex/pokedex_state.dart';
import '/services/api_pokedex.dart';
import '../trans/translations.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String appBarTitle = translations[myLocale.languageCode]?['pokedex'] ?? 'Pokedex';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: BlocProvider(
        create: (context) => PokedexBloc(apiService: ApiService())..add(FetchPokemonEvent()),
        child: const PokedexView(),
      ),
    );
  }
}

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    String capitalize(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<PokedexBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonLoaded) {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = state.pokemons[index];
                return ListTile(
                  leading: Image.network(
                    pokemon.imageUrl,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(capitalize(pokemon.name)),
                  subtitle: Text('#${pokemon.id}'),
                );
              },
            );
          } else if (state is PokemonError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Seleccione un Pokémon'));
          }
        },
      ),
    );
  }
}
