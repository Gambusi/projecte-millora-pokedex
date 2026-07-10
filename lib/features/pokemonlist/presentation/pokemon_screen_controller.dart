import 'package:flutter_curs/features/pokemonlist/data/pokemon_repository.dart';
import '../domain/pokemon_model.dart';

class PokemonScreenController {
  final PokemonRepository pokemonRepository = PokemonRepository();

  Future<Pokemon> fetchPokemon(int pokemonId) async {
    return await pokemonRepository.getPokemon(pokemonId);
  }
}
