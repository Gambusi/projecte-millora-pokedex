import 'package:flutter/material.dart';

class PokeEntry {
  const PokeEntry({required this.name, required this.dexNumber});
  final String name;
  final int dexNumber;
}

class FunctionsScreen extends StatelessWidget {
  const FunctionsScreen({super.key});

  String _formatPokemon(String name, int level) {
    return '$name (level $level)';
  }

  String _formatShort(String name, int level) => '$name Lv.$level';

  String _pokemonLine({required String name, int level = 1}) {
    return '$name starts at level $level';
  }

  String _greeting({required String who, String tone = 'Hi'}) {
    return '$tone, $who!';
  }

  String _formatDex(PokeEntry e) {
    return '#${e.dexNumber.toString()} ${e.name}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final lines = <String>[
      _formatPokemon('Mew', 50),
      _formatShort('Pikachu', 25),
      _pokemonLine(name: 'Squirtle'),
      _pokemonLine(name: 'Charizard', level: 80),
      _greeting(who: 'Ash'),
      _greeting(who: 'Misty', tone: 'Hey'),
      _formatDex(const PokeEntry(name: 'Bulbasaur', dexNumber: 1)),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Funcions')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Normal, arrow, named (required/defaults), Object? quan el valor pot ser de qualsevol tipus, i model propi (classe).',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < lines.length; i++) ...[
                    if (i > 0) const SizedBox(height: 12),
                    Text(
                      lines[i],
                      style: theme.bodyLarge?.copyWith(fontFamily: 'monospace'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
