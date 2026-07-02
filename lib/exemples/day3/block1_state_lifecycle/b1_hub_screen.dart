import 'package:flutter/material.dart';

import '../widgets/block_hub.dart';
import 'app_lc_screen.dart';
import 'widget_lc_screen.dart';

class Day3B1HubScreen extends StatelessWidget {
  const Day3B1HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Dia 3 · Bloc 1 · Estat i lifecycles',
      items: [
        Day3DemoItem(
          title: 'Cicle de vida del StatefulWidget',
          subtitle:
              'initState, build, dispose… Sense setState, no hi ha repinteig del que depèn del estat local.',
          screen: WidgetLcScreen(),
        ),
        Day3DemoItem(
          title: "Cicle de vida de l'app",
          subtitle:
              'WidgetsBindingObserver: resumed, inactive, paused, detached.',
          screen: AppLcScreen(),
        ),
      ],
    );
  }
}
