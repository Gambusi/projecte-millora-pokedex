import 'package:dio/dio.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonRepository {
  Future<Pokemon> getPokemon(int pokemonId) async {
    final response = await Dio().get(
      'https://pokeapi.co/api/v2/pokemon/$pokemonId/',
    );
    return Pokemon.fromJson(response.data);
  }
}
