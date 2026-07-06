import 'package:flutter/material.dart';

class AdaptiveMenusScreen extends StatelessWidget {
  const AdaptiveMenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menús adaptatius')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 700;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 20),
              if (wide)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: MenuBar(
                      children: [
                        SubmenuButton(
                          menuChildren: [
                            MenuItemButton(
                              onPressed: () => _toast(context, 'Obrir'),
                              child: const Text('Obrir…'),
                            ),
                            MenuItemButton(
                              onPressed: () => _toast(context, 'Desar'),
                              child: const Text('Desar'),
                            ),
                          ],
                          child: const Text('Fitxer'),
                        ),
                        SubmenuButton(
                          menuChildren: [
                            MenuItemButton(
                              onPressed: () => _toast(context, 'Tallar'),
                              child: const Text('Tallar'),
                            ),
                            MenuItemButton(
                              onPressed: () => _toast(context, 'Copiar'),
                              child: const Text('Copiar'),
                            ),
                          ],
                          child: const Text('Editar'),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.centerLeft,
                  child: PopupMenuButton<String>(
                    tooltip: 'Opcions',
                    onSelected: (v) => _toast(context, v),
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'Obrir', child: Text('Obrir…')),
                      PopupMenuItem(value: 'Desar', child: Text('Desar')),
                      PopupMenuDivider(),
                      PopupMenuItem(value: 'Tallar', child: Text('Tallar')),
                      PopupMenuItem(value: 'Copiar', child: Text('Copiar')),
                    ],
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.more_vert),
                          SizedBox(width: 8),
                          Text('Menú compacte'),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  static void _toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
