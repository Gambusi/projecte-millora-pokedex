import 'package:flutter/material.dart';

class TopBarScreen extends StatefulWidget {
  const TopBarScreen({super.key});

  @override
  State<TopBarScreen> createState() => _TopBarScreenState();
}

class _TopBarScreenState extends State<TopBarScreen> {
  String _textDelPop = 'enrere automàtic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top bar (AppBar)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Acció típica al top: cercar')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FilledButton.icon(
            onPressed: () async {
              final text = await Navigator.push<String>(
                context,
                MaterialPageRoute<String>(builder: (_) => const _Lvl2Screen()),
              );
              if (!mounted || text == null) return;
              setState(() => _textDelPop = text);
            },
            icon: const Icon(Icons.layers),
            label: Text('Segon nivell ($_textDelPop)'),
          ),
        ),
      ),
    );
  }
}

class _Lvl2Screen extends StatelessWidget {
  const _Lvl2Screen();

  static const String _missatgeAlPop = 'Arnau';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segona pantalla')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: FilledButton.icon(
            onPressed: () {
              Navigator.pop<String>(context, _missatgeAlPop);
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text('Torna (envia text al pop)'),
          ),
        ),
      ),
    );
  }
}
