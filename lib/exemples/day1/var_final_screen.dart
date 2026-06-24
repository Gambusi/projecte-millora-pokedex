import 'package:flutter/material.dart';

class VarFinalScreen extends StatelessWidget {
  const VarFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    var name = 'Charmander';
    name = 'Charmeleon';

    final starterLocked = 'Bulbasaur';

    final capturedAt = DateTime.now();
    const maxTeamSize = 6;

    late String description;
    description = 'Fire type pokemon';

    dynamic flexible = 3;
    flexible = 'Ara: String (abans int)';

    return Scaffold(
      appBar: AppBar(title: const Text('var / final / const / late')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'var (es pot reassignar), final (una vegada assignat), const (compilació), late (després), dynamic.',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _row(theme, 'var name', name),
                  _row(theme, 'final starterLocked', starterLocked),
                  _row(
                    theme,
                    'dynamic flexible',
                    '$flexible (${flexible.runtimeType})',
                  ),
                  _row(theme, 'final capturedAt', capturedAt.toString()),
                  _row(theme, 'const maxTeamSize', '$maxTeamSize'),
                  _row(theme, 'late description', description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _row(TextTheme theme, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.bodySmall),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
