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

  /// Afegim variable per al text del cercador
  String searchText = '';

  /// Llista completa de Pokémon
  List<Pokemon> allPokemon = [];

  /// Llista de Pokémon recuperada des de la PokéAPI
  late Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();

    // Carreguem els primers Pokémon en obrir la pantalla
    pokemonList = controller.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pokédex',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar Pokémon',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),

              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          const SizedBox(height: 16),

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

                // Guardem la llista completa de Pokémon
                allPokemon = snapshot.data!;

                // Filtratge segons el text escrit
                final filteredPokemon = allPokemon.where((pokemon) {
                  return pokemon.name.toLowerCase().contains(
                    searchText.toLowerCase(),
                  );
                }).toList();

                // Mostrem tots els Pokémon recuperats
                return ListView.builder(
                  itemCount: filteredPokemon.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(pokemon: filteredPokemon[index]);
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
