import 'dart:ui';

class Pokemon {
  const Pokemon({
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
