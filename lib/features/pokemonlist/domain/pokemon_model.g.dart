// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: _typeFromJson(json['types'] as List),
  imageUrl: _imageUrlFromJson(json['sprites'] as Map<String, dynamic>),
  color: _colorFromTypes(_readTypes(json, 'color') as List),
);

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.type,
  'sprites': instance.imageUrl,
};
