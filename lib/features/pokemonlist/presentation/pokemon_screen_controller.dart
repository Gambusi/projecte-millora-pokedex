import 'package:flutter_curs/features/pokemonlist/data/pokemon_repository.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonScreenController {
  final PokemonRepository pokemonRepository = PokemonRepository();

  Future<Pokemon> fetchPokemon(int pokemonId) async {
    return await pokemonRepository.getPokemon(pokemonId);
  }

  /// Recupera una llista de Pokémon
  Future<List<Pokemon>> fetchPokemonList() async {
    return await pokemonRepository.getPokemonList();
  }
}
