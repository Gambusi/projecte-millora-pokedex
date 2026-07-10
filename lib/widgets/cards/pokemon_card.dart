import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';
import 'package:flutter_curs/features/pokemonlist/presentation/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  // Pokémon rebut des de la pantalla de llista
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Quan l'usuari prem la targeta,
      // naveguem a la pantalla de detall
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PokemonDetailScreen(pokemon: pokemon),
          ),
        );
      },

      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // Utilitzem el color associat al tipus de Pokémon
        color: pokemon.color.withValues(alpha: 0.3),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              // Nom del Pokémon
              Text(pokemon.name, style: Theme.of(context).textTheme.titleLarge),

              // Imatge oficial del Pokémon
              Image.network(pokemon.imageUrl, width: 96, height: 96),
            ],
          ),
        ),
      ),
    );
  }
}
