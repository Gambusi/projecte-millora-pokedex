import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _index = 0;

  static const _titles = ['Inici', 'Cerca', 'Perfil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom bar · ${_titles[_index]}')),
      body: IndexedStack(
        index: _index,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text('Inici', style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cerca',
                  hintText: 'Nom del Pokémon…',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                  child: const Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 16),
                Text(
                  'El teu perfil',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inici',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search),
            label: 'Cerca',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
