import 'package:flutter_bloc/flutter_bloc.dart';
import '/services/api_pokedex.dart';
import 'pokedex_event.dart';
import 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokemonEvent, PokemonState> {
  final ApiService apiService;

  PokedexBloc({required this.apiService}) : super(PokemonInitial()) {
    on<FetchPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoading());
        final pokemons = await apiService.getPokemonList();
        emit(PokemonLoaded(pokemons));
      } catch (e) {
        emit(PokemonError(e.toString()));
      }
    });
  }
}
