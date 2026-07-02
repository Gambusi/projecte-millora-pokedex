import 'package:flutter/material.dart';

class ExplicitTransitionWidgetsScreen extends StatefulWidget {
  const ExplicitTransitionWidgetsScreen({super.key});

  @override
  State<ExplicitTransitionWidgetsScreen> createState() =>
      _ExplicitTransitionWidgetsScreenState();
}

class _ExplicitTransitionWidgetsScreenState
    extends State<ExplicitTransitionWidgetsScreen>
    with SingleTickerProviderStateMixin {
  bool _forwardNext = true;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  late final Animation<double> _fade = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.55, curve: Curves.easeOut),
  );

  late final Animation<double> _scale = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.25, 1, curve: Curves.elasticOut),
  );

  late final Animation<double> _turn = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.45, 1, curve: Curves.easeInOut),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Transitions explícites')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_forwardNext) {
            _controller.forward(from: 0);
          } else {
            _controller.reverse(from: 1);
          }
          setState(() => _forwardNext = !_forwardNext);
        },
        icon: Icon(_forwardNext ? Icons.arrow_forward : Icons.arrow_back),
        label: Text(_forwardNext ? 'Endavant' : 'Enrere'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: RotationTransition(
              turns: _turn,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                color: scheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 36,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.animation, size: 48, color: scheme.primary),
                      const SizedBox(height: 12),
                      Text(
                        'Fade · Scale · Rotation',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
