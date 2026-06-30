import 'package:flutter/material.dart';

import '../widgets/block_hub.dart';
import 'card_layout_screen.dart';
import 'list_view_screen.dart';
import 'stack_badge_screen.dart';
import 'text_theme_screen.dart';

class Day2B1HubScreen extends StatelessWidget {
  const Day2B1HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day2BlockHub(
      appBarTitle: 'Dia 2 · Llista i layout',
      items: [
        Day2DemoItem(
          title: 'Stack i superposició',
          subtitle:
              'Com apilar widgets (avatar, badge, número) i quan té sentit Positioned.',
          screen: StackBadgeScreen(),
        ),
        Day2DemoItem(
          title: 'Theme i TextTheme',
          subtitle:
              "Centralitzar colors i tipografies; Theme local per una part de l'arbre.",
          screen: TextThemeScreen(),
        ),
        Day2DemoItem(
          title: 'Card composada (Row, Column, Expanded)',
          subtitle:
              'Un patró típic: imatge + texts + chip; ús de Theme.of(context).',
          screen: CardLayoutScreen(),
        ),
        Day2DemoItem(
          title: 'ListView.builder',
          subtitle:
              'Lazy load: només es creen els ítems visibles al viewport.',
          screen: ListViewScreen(),
        ),
      ],
    );
  }
}
