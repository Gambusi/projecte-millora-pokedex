import 'package:flutter/material.dart';
import 'package:flutter_curs/widgets/cards/pokemon_card.dart';

import 'package:flutter_curs/features/pokemonlist/domain/pokemon_model.dart';
import 'pokemon_screen_controller.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PokemonScreenController controller = PokemonScreenController();
  // Llista de Pokémon recuperada des de la PokéAPI
  late Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
    // Carreguem els primers Pokémon en obrir la pantalla
    pokemonList = controller.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: Column(
        children: [
          // Mostrem la llista de Pokémon dins d'un FutureBuilder
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: pokemonList,
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

                // Mostrem tots els Pokémon recuperats
                return ListView.builder(
                  itemCount: snapshot.data!.length,

                  itemBuilder: (context, index) {
                    return PokemonCard(pokemon: snapshot.data![index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
