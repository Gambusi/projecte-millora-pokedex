import 'package:flutter/material.dart';

class ImplicitAnimationWidgetsScreen extends StatefulWidget {
  const ImplicitAnimationWidgetsScreen({super.key});

  @override
  State<ImplicitAnimationWidgetsScreen> createState() =>
      _ImplicitAnimationWidgetsScreenState();
}

class _ImplicitAnimationWidgetsScreenState
    extends State<ImplicitAnimationWidgetsScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Animacions implícites')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _expanded = !_expanded),
        icon: Icon(_expanded ? Icons.unfold_less : Icons.unfold_more),
        label: Text(_expanded ? 'Torna' : 'Destaca'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final fullWidth = constraints.maxWidth.isFinite
                  ? constraints.maxWidth
                  : MediaQuery.sizeOf(context).width - 32;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOutCubic,
                width: _expanded ? fullWidth : 160,
                height: _expanded ? 140 : 72,
                decoration: BoxDecoration(
                  color: _expanded
                      ? scheme.tertiaryContainer
                      : scheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(_expanded ? 28 : 12),
                ),
                alignment: Alignment.center,
                child: const Text('AnimatedContainer'),
              );
            },
          ),
          const SizedBox(height: 24),
          AnimatedAlign(
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            alignment: _expanded ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('AnimatedAlign'),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: _expanded ? 1 : 0.35,
            child: Text(
              'AnimatedOpacity',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
