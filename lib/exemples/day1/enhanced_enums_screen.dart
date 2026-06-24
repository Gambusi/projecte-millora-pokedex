import 'package:flutter/material.dart';

enum BasicTaskPriority { backlog, normal, urgent }

int _basicRank(BasicTaskPriority p) => switch (p) {
  BasicTaskPriority.backlog => 0,
  BasicTaskPriority.normal => 1,
  BasicTaskPriority.urgent => 2,
};

String _basicLabel(BasicTaskPriority p) => switch (p) {
  BasicTaskPriority.backlog => 'Backlog',
  BasicTaskPriority.normal => 'Normal',
  BasicTaskPriority.urgent => 'Urgent',
};

IconData _basicIcon(BasicTaskPriority p) => switch (p) {
  BasicTaskPriority.backlog => Icons.inventory_2_outlined,
  BasicTaskPriority.normal => Icons.task_alt,
  BasicTaskPriority.urgent => Icons.priority_high,
};

Color _basicAccentColor(BasicTaskPriority p, ColorScheme scheme) => switch (p) {
  BasicTaskPriority.backlog => scheme.outline,
  BasicTaskPriority.normal => scheme.primary,
  BasicTaskPriority.urgent => scheme.error,
};

enum TaskPriority {
  backlog(0, 'Backlog', Icons.inventory_2_outlined),
  normal(1, 'Normal', Icons.task_alt),
  urgent(2, 'Urgent', Icons.priority_high);

  const TaskPriority(this.rank, this.label, this.icon);

  final int rank;
  final String label;
  final IconData icon;

  Color accentColor(ColorScheme scheme) => switch (this) {
    TaskPriority.backlog => scheme.outline,
    TaskPriority.normal => scheme.primary,
    TaskPriority.urgent => scheme.error,
  };
}

class EnhancedEnumsScreen extends StatefulWidget {
  const EnhancedEnumsScreen({super.key});

  @override
  State<EnhancedEnumsScreen> createState() => _EnhancedEnumsScreenState();
}

class _EnhancedEnumsScreenState extends State<EnhancedEnumsScreen> {
  BasicTaskPriority _basicSelected = BasicTaskPriority.normal;
  TaskPriority _selected = TaskPriority.normal;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Enums')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 12),
          Text('Enum simple', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          SegmentedButton<BasicTaskPriority>(
            segments: [
              for (final p in BasicTaskPriority.values)
                ButtonSegment<BasicTaskPriority>(
                  value: p,
                  icon: Icon(_basicIcon(p)),
                  label: Text(_basicLabel(p)),
                ),
            ],
            selected: {_basicSelected},
            onSelectionChanged: (s) => setState(() => _basicSelected = s.first),
          ),
          const SizedBox(height: 8),
          Card(
            color: scheme.surfaceContainerHighest,
            child: ListTile(
              leading: Icon(
                _basicIcon(_basicSelected),
                color: _basicAccentColor(_basicSelected, scheme),
              ),
              title: Text(_basicLabel(_basicSelected)),
              subtitle: Text('Rank ${_basicRank(_basicSelected)}.'),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Enum avançat (mateixes variants)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          SegmentedButton<TaskPriority>(
            segments: [
              for (final p in TaskPriority.values)
                ButtonSegment<TaskPriority>(
                  value: p,
                  icon: Icon(p.icon),
                  label: Text(p.label),
                ),
            ],
            selected: {_selected},
            onSelectionChanged: (s) => setState(() => _selected = s.first),
          ),
          const SizedBox(height: 16),
          Card(
            color: scheme.surfaceContainerHighest,
            child: ListTile(
              leading: Icon(
                _selected.icon,
                color: _selected.accentColor(scheme),
              ),
              title: Text(_selected.label),
              subtitle: Text('Rank ${_selected.rank}.'),
            ),
          ),
        ],
      ),
    );
  }
}
