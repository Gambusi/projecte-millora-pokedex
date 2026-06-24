import 'package:flutter/material.dart';

class VariablesScreen extends StatelessWidget {
  const VariablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final String name = 'Pikachu';
    final int level = 25;
    final double weight = 6.0;
    final bool isFavorite = true;

    return Scaffold(
      appBar: AppBar(title: const Text('Variables')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('String, int, double i bool:', style: theme.bodyLarge),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _row(theme, 'name (String)', name),
                  _row(theme, 'level (int)', '$level'),
                  _row(theme, 'weight (double)', '$weight kg'),
                  _row(theme, 'isFavorite (bool)', '$isFavorite'),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text(label, style: theme.bodySmall)),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
