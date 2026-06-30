import 'package:flutter/material.dart';

import '../data/poke_data.dart';
import '../widgets/poke_card.dart';

class CardLayoutScreen extends StatelessWidget {
  const CardLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card composada')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Day2PokeCard(pokemon: kD2Pokes.first),
          Day2PokeCard(pokemon: kD2Pokes[1]),
        ],
      ),
    );
  }
}
