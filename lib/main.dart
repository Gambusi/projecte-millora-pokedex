import 'package:flutter/material.dart';
import 'package:flutter_curs/exemples/day2/day2_hub_screen.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Day2HubScreen());
  }
}
