import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/data/favorites_repository.dart';
import 'package:flutter_curs/features/pokemonlist/data/pokemon_repository.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';
import 'package:flutter_curs/widgets/cards/pokemon_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesRepository favoritesRepository = FavoritesRepository();

  final PokemonRepository pokemonRepository = PokemonRepository();

  /// Recuperem els IDs guardats i obtenim
  /// les dades completes dels Pokémon favorits.
  Future<List<Pokemon>> _loadFavorites() async {
    final favoriteIds = await favoritesRepository.getFavorites();

    final List<Pokemon> pokemonList = [];

    for (final id in favoriteIds) {
      final pokemon = await pokemonRepository.getPokemon(id);

      pokemonList.add(pokemon);
    }

    return pokemonList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Favorits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              // Recarreguem els favorits cada vegada que es reconstrueix
              // la pantalla.
              future: _loadFavorites(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No tens cap Pokémon favorit'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,

                  itemBuilder: (context, index) {
                    return PokemonCard(pokemon: snapshot.data![index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
