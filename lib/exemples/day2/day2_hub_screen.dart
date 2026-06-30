import 'package:flutter/material.dart';

import 'block1_list_layout/b1_hub_screen.dart';
import 'block2_navigation/b2_hub_screen.dart';
import 'widgets/root_hub.dart';

class Day2HubScreen extends StatelessWidget {
  const Day2HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day2RootHub(
      title: 'Dia 2 · Exemples',
      sections: [
        Day2HubSection(
          badge: '1',
          title: 'Llista i layout',
          subtitle: 'Stack, Theme, card composada, ListView.builder',
          screen: Day2B1HubScreen(),
        ),
        Day2HubSection(
          badge: '2',
          title: 'Navegació',
          subtitle: 'Top · bottom · side · Navigator amb screen stack',
          screen: Day2B2HubScreen(),
        ),
      ],
    );
  }
}
