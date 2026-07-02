import 'package:flutter/material.dart';
import 'package:flutter_curs/features/pokemonlist/data/pokemon_repository.dart';
import 'package:flutter_curs/widgets/cards/pokemon_card.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: ListView.builder(
        itemCount: listPokemons.length,
        itemBuilder: (context, index) {
          return PokemonCard(pokemon: listPokemons[index]);
        },
      ),
    );
  }
}
