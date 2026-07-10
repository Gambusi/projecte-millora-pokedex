import 'package:dio/dio.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonRepository {
  Future<Pokemon> getPokemon(int pokemonId) async {
    final response = await Dio().get(
      'https://pokeapi.co/api/v2/pokemon/$pokemonId/',
    );
    return Pokemon.fromJson(response.data);
  }

  // Recupera els primers Pokémon de la PokéAPI
  Future<List<Pokemon>> getPokemonList() async {
    final List<Pokemon> pokemonList = [];

    // Obtenim els primers 20 Pokémon
    for (int i = 1; i <= 20; i++) {
      final pokemon = await getPokemon(i);

      pokemonList.add(pokemon);
    }
    return pokemonList;
  }
}
