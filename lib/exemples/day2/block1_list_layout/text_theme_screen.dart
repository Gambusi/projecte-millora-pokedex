import 'package:flutter/material.dart';

class _SameThemeDemoCard extends StatelessWidget {
  const _SameThemeDemoCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.palette_outlined, color: cs.primary, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Bloc comparatiu',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Cos amb bodyMedium; el ColorScheme pinta icona, superfície i botó.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Acció tonal'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextThemeScreen extends StatelessWidget {
  const TextThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Theme i TextTheme')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          Text(
            'Tema global (MaterialApp)',
            style: baseTheme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          const _SameThemeDemoCard(),
          const SizedBox(height: 24),
          Text(
            'Tema local (només aquesta sub-arrel)',
            style: baseTheme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Theme(
            data: baseTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 194, 0, 32),
              ),
              textTheme: baseTheme.textTheme.copyWith(
                bodyMedium: baseTheme.textTheme.bodyMedium?.copyWith(
                  fontSize: 25,
                ),
              ),
            ),
            child: const _SameThemeDemoCard(),
          ),
        ],
      ),
    );
  }
}
