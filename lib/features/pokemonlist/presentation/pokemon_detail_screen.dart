import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/data/favorites_repository.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final FavoritesRepository favoritesRepository = FavoritesRepository();

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavorite();
  }

  /// Comprovem si el Pokémon ja està guardat com a favorit
  Future<void> _loadFavorite() async {
    isFavorite = await favoritesRepository.isFavorite(widget.pokemon.id);

    setState(() {});
  }

  /// Afegeix o elimina el Pokémon dels favorits
  Future<void> _toggleFavorite() async {
    await favoritesRepository.toggleFavorite(widget.pokemon.id);

    await _loadFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),

        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),

            onPressed: _toggleFavorite,
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // Imatge gran del Pokémon
            Image.network(widget.pokemon.imageUrl, width: 250, height: 250),

            const SizedBox(height: 24),

            // Nom destacat
            Text(
              widget.pokemon.name.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            // Informació principal del Pokémon
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    Text(
                      'ID: ${widget.pokemon.id}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Tipus: ${widget.pokemon.type}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
