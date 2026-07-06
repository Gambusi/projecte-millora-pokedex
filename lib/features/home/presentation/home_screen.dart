import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_curs/features/map/presentation/map_screen.dart';
import 'package:flutter_curs/features/pokemonlist/presentation/pokemon_screen.dart';
import 'package:flutter_curs/features/profile/presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int _index = 0;

  Future _benvingut() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Benvingut de nou'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('D\'acord'),
          ),
        ],
      ),
    );
  }

  Future<void> _descarregaApp() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Millor experiència a l\'app'),
        content: const Text(
          'Per gaudir de totes les funcions, descarrega l\'aplicació al teu dispositiu.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('D\'acord'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _descarregaApp());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) _benvingut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [MapScreen(), PokemonScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Llista'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
