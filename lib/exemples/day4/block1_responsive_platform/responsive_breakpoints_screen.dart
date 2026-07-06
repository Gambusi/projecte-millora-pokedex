import 'package:flutter/material.dart';

enum _BreakpointLayout {
  compact(600, 1, 'Compact (< 600 dp)'),
  medium(900, 2, 'Medium (600–899 dp)'),
  expanded(double.infinity, 3, 'Expanded (≥ 900 dp)');

  const _BreakpointLayout(this.maxWidthExclusive, this.columns, this.label);

  final double maxWidthExclusive;
  final int columns;
  final String label;

  static _BreakpointLayout fromWidth(double widthDp) {
    for (final tier in _BreakpointLayout.values) {
      if (widthDp < tier.maxWidthExclusive) return tier;
    }
    return expanded;
  }
}

class ResponsiveBreakpointsScreen extends StatelessWidget {
  const ResponsiveBreakpointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breakpoints i LayoutBuilder')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final layout = _BreakpointLayout.fromWidth(w);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Amplada: ${w.toStringAsFixed(0)} dp · ${layout.label} · '
                    'Grid ${layout.columns} columnes',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(12),
                  crossAxisCount: layout.columns,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    for (var i = 0; i < 6; i++)
                      Card(
                        child: Center(
                          child: Text(
                            'Ítem ${i + 1}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
