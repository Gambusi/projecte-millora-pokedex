import 'package:flutter/material.dart';

class AppLcScreen extends StatefulWidget {
  const AppLcScreen({super.key});

  @override
  State<AppLcScreen> createState() => _AppLcScreenState();
}

class _AppLcScreenState extends State<AppLcScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint('[AppLifecycle] ${_labelFor(state)}');
  }

  String _labelFor(AppLifecycleState state) {
    return switch (state) {
      AppLifecycleState.resumed =>
        'resumed → L’app és visible i l’usuari pot interactuar.',
      AppLifecycleState.inactive =>
        'inactive → Estats intermedis (overlay, bloquejos curts …); '
        'sobretot sensible a iOS (p.ex. pantalla amb trucada).',
      AppLifecycleState.paused =>
        'paused → L’app està en segon pla (no és el procés primer pla).',
      AppLifecycleState.detached =>
        'detached → La vista Flutter es separa del contenidor natiu; el motor '
        'pot sobreviure una mica mentre el sistema tanca o canvies de finestres.',
      AppLifecycleState.hidden =>
        'hidden → Sense UI dibuixat a pantalla (sovint precedeix paused).',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cicle de vida de l’app')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Prova-ho', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text(
            'Envia l’app en segon pla (Home / App Switcher) i torna. '
            'Mira la consola de depuració per veure els canvis d’estat.',
          ),
        ],
      ),
    );
  }
}
