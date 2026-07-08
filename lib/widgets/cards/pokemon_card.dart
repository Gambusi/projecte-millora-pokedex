import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: pokemon.color.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(pokemon.name, style: Theme.of(context).textTheme.titleLarge),
            Image.network(pokemon.imageUrl, width: 96, height: 96),
          ],
        ),
      ),
    );
  }
}
