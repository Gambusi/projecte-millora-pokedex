import 'package:flutter/material.dart';

class AnimationControllerTweenScreen extends StatefulWidget {
  const AnimationControllerTweenScreen({super.key});

  @override
  State<AnimationControllerTweenScreen> createState() =>
      _AnimationControllerTweenScreenState();
}

class _AnimationControllerTweenScreenState
    extends State<AnimationControllerTweenScreen>
    with SingleTickerProviderStateMixin {
  bool _forwardNext = true;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  late final Animation<double> _widthFactor = Tween<double>(
    begin: 0.35,
    end: 0.7,
  ).animate(_curve);

  late final Animation<BorderRadius?> _radius = BorderRadiusTween(
    begin: BorderRadius.circular(12),
    end: BorderRadius.only(
      topLeft: Radius.circular(36),
      bottomRight: Radius.circular(0),
    ),
  ).animate(_curve);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Controller i Tween')),
      floatingActionButton: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Transform.translate(
            offset: Offset(_widthFactor.value * 100 - 50, 0),
            child: FloatingActionButton.extended(
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
          );
        },
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return FractionallySizedBox(
              widthFactor: _widthFactor.value,
              child: Material(
                color: scheme.primaryContainer,
                borderRadius: _radius.value,
                elevation: 2,
                child: const SizedBox(
                  height: 96,
                  child: Center(child: Text('AnimatedBuilder')),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
