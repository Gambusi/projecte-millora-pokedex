import 'package:flutter/material.dart';

import 'demo_tile.dart';

class Day3DemoItem {
  const Day3DemoItem({
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Widget screen;
}

/// Hub d’un bloc (`Scaffold` + llista als exemples). Patró igual que [Day3RootHub]
/// però un nivell avall — tampoc és una pantalla-demostració concreta.
class Day3BlockHub extends StatelessWidget {
  const Day3BlockHub({
    super.key,
    required this.appBarTitle,
    required this.items,
  });

  final String appBarTitle;
  final List<Day3DemoItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: ListView(
        padding: const EdgeInsets.only(top: 12),
        children: [
          for (final d in items)
            Day3DemoTile(
              title: d.title,
              subtitle: d.subtitle,
              screen: d.screen,
            ),
        ],
      ),
    );
  }
}
