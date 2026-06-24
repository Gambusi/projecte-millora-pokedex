import 'package:flutter/material.dart';

class NullSafetyScreen extends StatelessWidget {
  const NullSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final String name = 'Eevee';
    final String? nickname = null;

    final nameLength = name.length;
    final nicknameLengthOrNull = nickname?.length;
    final nicknameOrFallback = nickname ?? 'No nickname';

    return Scaffold(
      appBar: AppBar(title: const Text('Null safety')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'String no nullable vs String?, operadors ?. i ??',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _row(theme, 'name', name),
                  _row(theme, 'name.length', '$nameLength'),
                  _row(theme, 'nickname', nickname ?? 'null'),
                  _row(theme, 'nickname?.length', '$nicknameLengthOrNull'),
                  _row(theme, 'nickname ?? …', nicknameOrFallback),
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
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: theme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
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
