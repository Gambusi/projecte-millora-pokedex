import 'package:flutter/material.dart';

import 'demo_tile.dart';

class Day2DemoItem {
  const Day2DemoItem({
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Widget screen;
}

/// Hub d’un bloc (`Scaffold` + llista als exemples). Patró igual que [Day2RootHub]
/// però un nivell avall — tampoc és una pantalla-demostració concreta.
class Day2BlockHub extends StatelessWidget {
  const Day2BlockHub({
    super.key,
    required this.appBarTitle,
    required this.items,
  });

  final String appBarTitle;
  final List<Day2DemoItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: ListView(
        padding: const EdgeInsets.only(top: 12),
        children: [
          for (final d in items)
            Day2DemoTile(
              title: d.title,
              subtitle: d.subtitle,
              screen: d.screen,
            ),
        ],
      ),
    );
  }
}
