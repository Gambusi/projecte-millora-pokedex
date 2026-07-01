import 'package:flutter/material.dart';
// import 'package:flutter_curs/exemples/day2/day2_hub_screen.dart';
import 'package:flutter_curs/features/home/presentation/pokemon_screen.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: PokemonScreen(),
    );
  }
}
