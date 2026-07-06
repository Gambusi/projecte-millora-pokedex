import 'package:flutter/material.dart';

class AdaptiveNavigationShellScreen extends StatefulWidget {
  const AdaptiveNavigationShellScreen({super.key});

  @override
  State<AdaptiveNavigationShellScreen> createState() =>
      _AdaptiveNavigationShellScreenState();
}

class _AdaptiveNavigationShellScreenState
    extends State<AdaptiveNavigationShellScreen> {
  int _index = 0;

  static const _railBreakpoint = 720.0;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pages = [
      _PlaceholderPane(title: 'Inici', color: scheme.primaryContainer),
      _PlaceholderPane(title: 'Cerca', color: scheme.secondaryContainer),
      _PlaceholderPane(title: 'Perfil', color: scheme.tertiaryContainer),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final useRail = constraints.maxWidth >= _railBreakpoint;
        return Scaffold(
          appBar: AppBar(title: const Text('Shell adaptatiu')),
          body: Row(
            children: [
              if (useRail)
                NavigationRail(
                  extended: constraints.maxWidth >= 1100,
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  labelType: constraints.maxWidth >= 1100
                      ? null
                      : NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Inici'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.search),
                      selectedIcon: Icon(Icons.search),
                      label: Text('Cerca'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: Text('Perfil'),
                    ),
                  ],
                ),
              Expanded(child: pages[_index]),
            ],
          ),
          bottomNavigationBar: useRail
              ? null
              : NavigationBar(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Inici',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search),
                      label: 'Cerca',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: 'Perfil',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _PlaceholderPane extends StatelessWidget {
  const _PlaceholderPane({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
