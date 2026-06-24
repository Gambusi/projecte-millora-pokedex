import 'package:flutter/material.dart';

class PatternMatchingScreen extends StatelessWidget {
  const PatternMatchingScreen({super.key});

  String _describeLevel(int level) {
    return switch (level) {
      < 10 => 'beginner',
      >= 10 && < 50 => 'medium',
      >= 50 && < 70 => 'advanced',
      _ => 'strong',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final samples = [5, 25, 60, 80];

    return Scaffold(
      appBar: AppBar(title: const Text('Pattern matching')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('switch com a expressió amb intervals:', style: theme.bodyLarge),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  for (final level in samples) ...[
                    if (level != samples.first) const Divider(height: 24),
                    Row(
                      children: [
                        Text('level $level', style: theme.titleMedium),
                        const Spacer(),
                        Chip(
                          label: Text(_describeLevel(level)),
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
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
