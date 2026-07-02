import 'package:flutter/material.dart';

const _kLifecycleLines = <String>[
  'createState() — al StatefulWidget: crea l’objecte State (sense efectes).',
  'initState() — un cop insertat a l’arbre; inicialitzacions.',
  'didChangeDependencies() — quan canvien dependències InheritedWidget.',
  'build() — construeix l’UI.',
  'didUpdateWidget() — nous paràmetres del mateix tipus de widget del pare.',
  'deactivate() — el widget deixa temporalment de ser al arbre.',
  'dispose() — baixa definitiva; alliberar timers, subscriptions…',
];

class WidgetLcScreen extends StatefulWidget {
  const WidgetLcScreen({super.key});

  @override
  State<WidgetLcScreen> createState() => _WidgetLcScreenState();
}

class _WidgetLcScreenState extends State<WidgetLcScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('[State] initState ← createState() ja ha passat');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint(
      '[State] didChangeDependencies (InheritedWidget / tema / ruta…)',
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('[State] build() — comptador=$_counter');
    return Scaffold(
      appBar: AppBar(title: const Text('Cicle de vida (StatefulWidget)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Ordre', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < _kLifecycleLines.length; i++) ...[
                if (i > 0) const SizedBox(height: 12),
                Text('${i + 1}. ${_kLifecycleLines[i]}'),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Text('setState', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Text('Comptador del pare: $_counter'),
          const SizedBox(height: 8),
          _CounterChild(version: _counter),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => setState(() => _counter++),
            child: const Text(
              'Incrementa → build pare + fill, i didUpdateWidget al fill',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant WidgetLcScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint(
      '[State] didUpdateWidget ← el pare torna aquest widget amb nous paràmetres',
    );
  }

  @override
  void deactivate() {
    debugPrint('[State] deactivate (surto de l’arbre)');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('[State] dispose (no tornarà)');
    super.dispose();
  }
}

class _CounterChild extends StatefulWidget {
  const _CounterChild({required this.version});

  final int version;

  @override
  State<_CounterChild> createState() => _CounterChildState();
}

class _CounterChildState extends State<_CounterChild> {
  @override
  void didUpdateWidget(covariant _CounterChild oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint(
      '[Fill _CounterChild] didUpdateWidget: ${oldWidget.version} → ${widget.version}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.65),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'StatefulWidget fill',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 6),
            Text('widget.version venint del pare: ${widget.version}'),
          ],
        ),
      ),
    );
  }
}
