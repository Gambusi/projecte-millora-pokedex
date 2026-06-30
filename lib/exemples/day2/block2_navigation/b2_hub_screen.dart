import 'package:flutter/material.dart';

import '../widgets/block_hub.dart';
import 'bottom_nav_screen.dart';
import 'notifications_dialog_screen.dart';
import 'side_nav_screen.dart';
import 'top_bar_screen.dart';

class Day2B2HubScreen extends StatelessWidget {
  const Day2B2HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day2BlockHub(
      appBarTitle: 'Dia 2 · Navegació',
      items: [
        Day2DemoItem(
          title: 'Top bar — AppBar i segon nivell',
          subtitle: 'Títol, accions, botó enrere automàtic.',
          screen: TopBarScreen(),
        ),
        Day2DemoItem(
          title: 'Bottom bar — NavigationBar',
          subtitle: 'Destins arrel al peu',
          screen: BottomNavScreen(),
        ),
        Day2DemoItem(
          title: 'Side — Drawer',
          subtitle: 'Menú lateral amb icona ☰ .',
          screen: SideNavScreen(),
        ),
        Day2DemoItem(
          title: 'Diàlegs (alertes i notificacions)',
          subtitle:
              'Alerta dismissible; alerta bloquejada fins triar opció; tres opcions amb resultat opcional.',
          screen: NotificationsDialogScreen(),
        ),
      ],
    );
  }
}
