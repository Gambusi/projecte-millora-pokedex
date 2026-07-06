import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PlatformPointerScrollScreen extends StatefulWidget {
  const PlatformPointerScrollScreen({super.key});

  @override
  State<PlatformPointerScrollScreen> createState() =>
      _PlatformPointerScrollScreenState();
}

class _PlatformPointerScrollScreenState
    extends State<PlatformPointerScrollScreen> {
  bool _hover = false;

  String _platformLabel(TargetPlatform p) => switch (p) {
    TargetPlatform.android => 'Android',
    TargetPlatform.iOS => 'iOS',
    TargetPlatform.linux => 'Linux',
    TargetPlatform.macOS => 'macOS',
    TargetPlatform.windows => 'Windows',
    TargetPlatform.fuchsia => 'Fuchsia',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mqPlatform = theme.platform;

    return Scaffold(
      appBar: AppBar(title: const Text('Plataforma, punter i scroll')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Detecció', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _InfoCard(
            children: [
              Text('kIsWeb → $kIsWeb'),
              Text(
                'defaultTargetPlatform → '
                '${_platformLabel(defaultTargetPlatform)}',
              ),
              Text(
                'Theme.of(context).platform → ${_platformLabel(mqPlatform)}',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Widgets adaptatius', style: theme.textTheme.titleMedium),

          const SizedBox(height: 12),
          Row(
            children: [
              Switch.adaptive(value: true, onChanged: (_) {}),
              const SizedBox(width: 12),
              const Expanded(child: Text('Switch.adaptive')),
            ],
          ),
          const SizedBox(height: 24),
          Text('MouseRegion', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          MouseRegion(
            onEnter: (_) => setState(() => _hover = true),
            onExit: (_) => setState(() => _hover = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _hover
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _hover
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant,
                ),
              ),
              child: const Text(
                'Passa el ratolí per aquí (web/desktop).\nEn tacte no hi ha hover.',
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Scroll amb ratolí', style: theme.textTheme.titleMedium),

          SizedBox(
            height: 60,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Chip(label: Text('$i')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) const SizedBox(height: 6),
              DefaultTextStyle.merge(
                style: const TextStyle(fontFeatures: []),
                child: children[i],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
