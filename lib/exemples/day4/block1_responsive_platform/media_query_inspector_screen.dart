import 'package:flutter/material.dart';

class MediaQueryInspectorScreen extends StatelessWidget {
  const MediaQueryInspectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final orientation = MediaQuery.orientationOf(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    String oriLabel(Orientation o) =>
        o == Orientation.portrait ? 'Portrait' : 'Landscape';
    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          _InfoTile(
            'size',
            '${size.width.toStringAsFixed(1)} × ${size.height.toStringAsFixed(1)}',
          ),
          _InfoTile('orientation', oriLabel(orientation)),
          _InfoTile(
            'padding (L/T/R/B)',
            '${padding.left.toStringAsFixed(0)} / ${padding.top.toStringAsFixed(0)} / '
                '${padding.right.toStringAsFixed(0)} / ${padding.bottom.toStringAsFixed(0)}',
          ),
          _InfoTile(
            'viewInsets (L/T/R/B)',
            '${viewInsets.left.toStringAsFixed(0)} / ${viewInsets.top.toStringAsFixed(0)} / '
                '${viewInsets.right.toStringAsFixed(0)} / ${viewInsets.bottom.toStringAsFixed(0)}',
          ),
          _InfoTile(
            'textScaler',
            '${textScaler.scale(1).toStringAsFixed(2)}× (escala 1 text)',
          ),
          _InfoTile('devicePixelRatio', devicePixelRatio.toStringAsFixed(2)),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Camp per obri el teclat mòbil',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.title, this.value);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value, style: const TextStyle(fontFeatures: [])),
      ),
    );
  }
}
