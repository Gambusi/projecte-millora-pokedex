import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  static const String _favoritesKey = 'favorite_pokemon_ids';

  /// Recupera tots els Pokémon marcats com a favorits
  Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_favoritesKey);

    if (jsonString == null) {
      return [];
    }

    return List<int>.from(jsonDecode(jsonString));
  }

  /// Comprova si un Pokémon està marcat com a favorit
  Future<bool> isFavorite(int pokemonId) async {
    final favorites = await getFavorites();

    return favorites.contains(pokemonId);
  }

  /// Afegeix o elimina un Pokémon dels favorits
  Future<void> toggleFavorite(int pokemonId) async {
    final prefs = await SharedPreferences.getInstance();

    final favorites = await getFavorites();

    if (favorites.contains(pokemonId)) {
      favorites.remove(pokemonId);
    } else {
      favorites.add(pokemonId);
    }

    await prefs.setString(_favoritesKey, jsonEncode(favorites));
  }
}
