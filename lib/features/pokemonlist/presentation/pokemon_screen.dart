import 'package:flutter/material.dart';
import 'package:flutter_curs/widgets/cards/pokemon_card.dart';

import '../domain/pokemon_model.dart';
import 'pokemon_screen_controller.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PokemonScreenController controller = PokemonScreenController();
  late Future<Pokemon>? pokemon;

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  Future<void> fetchPokemon() async {
    pokemon = controller.fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: FutureBuilder<Pokemon>(
        future: pokemon,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: PokemonCard(pokemon: snapshot.data!),
          );
        },
      ),
    );
  }
}
