import 'package:flutter/material.dart';

import 'demo_tile.dart';

class Day1DemoItem {
  const Day1DemoItem({
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Widget screen;
}

class Day1RootHub extends StatelessWidget {
  const Day1RootHub({super.key, required this.title, required this.items});

  final String title;
  final List<Day1DemoItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.only(top: 12),
        children: [
          for (final d in items)
            Day1DemoTile(
              title: d.title,
              subtitle: d.subtitle,
              screen: d.screen,
            ),
        ],
      ),
    );
  }
}
