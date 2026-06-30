import 'package:flutter/material.dart';

class PokemonData {
  const PokemonData({
    required this.id,
    required this.name,
    required this.type,
    required this.imagePath,
    required this.color,
  });

  final int id;
  final String name;
  final String type;
  final String imagePath;
  final Color color;
}

const kD2Pokes = <PokemonData>[
  PokemonData(
    id: 1,
    name: 'Bulbasaur',
    type: 'Grass / Poison',
    imagePath: 'assets/images/1.png',
    color: Color(0xFF78C850),
  ),
  PokemonData(
    id: 4,
    name: 'Charmander',
    type: 'Fire',
    imagePath: 'assets/images/4.png',
    color: Color(0xFFF08030),
  ),
  PokemonData(
    id: 7,
    name: 'Squirtle',
    type: 'Water',
    imagePath: 'assets/images/7.png',
    color: Color(0xFF6890F0),
  ),
  PokemonData(
    id: 25,
    name: 'Pikachu',
    type: 'Electric',
    imagePath: 'assets/images/25.png',
    color: Color(0xFFF8D030),
  ),
  PokemonData(
    id: 3,
    name: 'Venusaur',
    type: 'Grass / Poison',
    imagePath: 'assets/images/3.png',
    color: Color(0xFF4E8234),
  ),
  PokemonData(
    id: 39,
    name: 'Jigglypuff',
    type: 'Normal / Fairy',
    imagePath: 'assets/images/39.png',
    color: Color(0xFFEE99AC),
  ),
];
