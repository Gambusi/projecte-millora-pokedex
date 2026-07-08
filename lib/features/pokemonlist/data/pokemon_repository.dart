import 'package:dio/dio.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonRepository {
  Future<Pokemon> getPokemon() async {
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/1/');
    return Pokemon.fromJson(response.data);
  }
}
