import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(pokemon.imageUrl, width: 250, height: 250),

            const SizedBox(height: 24),

            Text(
              pokemon.name.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            Text('ID: ${pokemon.id}'),

            Text('Tipus: ${pokemon.type}'),
          ],
        ),
      ),
    );
  }
}
