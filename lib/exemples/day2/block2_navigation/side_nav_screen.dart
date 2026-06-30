import 'package:flutter/material.dart';

class SideNavScreen extends StatefulWidget {
  const SideNavScreen({super.key});

  @override
  State<SideNavScreen> createState() => _SideNavScreenState();
}

class _SideNavScreenState extends State<SideNavScreen> {
  int _selected = 0;

  static const _labels = <String>['Equip', 'Obj.', 'Mapa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Side · Drawer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menú lateral',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            for (var i = 0; i < _labels.length; i++)
              ListTile(
                leading: Icon([Icons.groups, Icons.inventory_2, Icons.map][i]),
                title: Text(_labels[i]),
                selected: _selected == i,
                onTap: () {
                  setState(() => _selected = i);
                  Navigator.of(context).pop();
                },
              ),
          ],
        ),
      ),
      body: _buildCenterLabel(),
    );
  }

  Widget _buildCenterLabel() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Secció: ${_labels[_selected]}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
