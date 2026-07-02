import 'package:flutter/material.dart';

extension ImplicitAnimationWidgets on Widget {
  Widget animatedOpacity({
    required double opacity,
    Duration duration = const Duration(milliseconds: 350),
    Curve curve = Curves.easeInOut,
  }) => AnimatedOpacity(
    opacity: opacity,
    duration: duration,
    curve: curve,
    child: this,
  );

  Widget animatedScale({
    required double scale,
    Duration duration = const Duration(milliseconds: 380),
    Curve curve = Curves.easeOutBack,
    Alignment alignment = Alignment.center,
  }) => AnimatedScale(
    scale: scale,
    duration: duration,
    curve: curve,
    alignment: alignment,
    child: this,
  );

  Widget animatedSlide({
    required Offset offset,
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.easeOutCubic,
  }) => AnimatedSlide(
    offset: offset,
    duration: duration,
    curve: curve,
    child: this,
  );
}

class WidgetExtensionsScreen extends StatefulWidget {
  const WidgetExtensionsScreen({super.key});

  @override
  State<WidgetExtensionsScreen> createState() => _WidgetExtensionsScreenState();
}

class _WidgetExtensionsScreenState extends State<WidgetExtensionsScreen> {
  bool _emphasis = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Extensions i animació implícita')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _emphasis = !_emphasis),
        icon: Icon(_emphasis ? Icons.bolt_outlined : Icons.bolt),
        label: Text(_emphasis ? 'Torna' : 'Destaca'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            children: [
              Center(
                child: Icon(Icons.bolt, size: 56, color: scheme.primary)
                    .animatedSlide(
                      offset: _emphasis ? Offset.zero : const Offset(0, 0.12),
                    )
                    .animatedScale(scale: _emphasis ? 1.15 : 0.92)
                    .animatedOpacity(opacity: _emphasis ? 1 : 0.45),
              ),
              const SizedBox(height: 8),
              Text(
                'Extensions encadenades',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: _emphasis ? 1 : 0.45,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  child: AnimatedScale(
                    scale: _emphasis ? 1.15 : 0.92,
                    duration: const Duration(milliseconds: 380),
                    curve: Curves.easeOutBack,
                    alignment: Alignment.center,
                    child: AnimatedSlide(
                      offset: _emphasis ? Offset.zero : const Offset(0, 0.12),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutCubic,
                      child: Icon(
                        Icons.bolt_outlined,
                        size: 56,
                        color: scheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Mateix efecte, widgets niats',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
