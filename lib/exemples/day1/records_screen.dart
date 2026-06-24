import 'package:flutter/material.dart';

class Pokemon {
  const Pokemon({required this.name, required this.hp});
  final String name;
  final int hp;
}

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  ({String name, int hp}) _getPokemon() {
    return (name: 'Snorlax', hp: 160);
  }

  Pokemon _getPokemonAsClass() {
    return const Pokemon(name: 'Pikachu', hp: 35);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final pokemon = _getPokemon();
    final asClass = _getPokemonAsClass();

    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Retornar més d’un valor amb un record anomenat:',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('pokemon.name', style: theme.titleSmall),
                  const SizedBox(height: 4),
                  Text(pokemon.name, style: theme.headlineSmall),
                  const SizedBox(height: 20),
                  Text('pokemon.hp', style: theme.titleSmall),
                  const SizedBox(height: 4),
                  Text('${pokemon.hp}', style: theme.headlineSmall),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'O retornar una instància d’una classe normal:',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('asClass.name', style: theme.titleSmall),
                  const SizedBox(height: 4),
                  Text(asClass.name, style: theme.headlineSmall),
                  const SizedBox(height: 20),
                  Text('asClass.hp', style: theme.titleSmall),
                  const SizedBox(height: 4),
                  Text('${asClass.hp}', style: theme.headlineSmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
