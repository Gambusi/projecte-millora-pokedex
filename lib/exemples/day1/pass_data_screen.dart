import 'package:flutter/material.dart';

class PokemonName extends StatelessWidget {
  const PokemonName({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? 'No name',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class PassDataScreen extends StatelessWidget {
  const PassDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Passar dades')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'El pare passa el nom al fill amb el constructor:',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Widget fill', style: theme.titleSmall),
                  const SizedBox(height: 8),
                  const PokemonName(name: 'Pikachu'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'El fill només rep `name` i el pinta; no busca dades per compte propi.',
            style: theme.bodyMedium?.copyWith(color: theme.bodySmall?.color),
          ),
        ],
      ),
    );
  }
}
