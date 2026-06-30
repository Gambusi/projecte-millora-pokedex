import 'dart:math' show min;

import 'package:flutter/material.dart';

import '../data/poke_data.dart';
import '../widgets/poke_card.dart';

const double _kMaxCombinedListsHeight = 480;

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  static const _outer = EdgeInsets.all(24);
  static const _section = EdgeInsets.symmetric(horizontal: 20, vertical: 14);
  static const _list = EdgeInsets.fromLTRB(8, 12, 8, 16);

  static Widget _item(String modeLabel, int index, PokemonData pokemon) {
    debugPrint(
      '[$modeLabel] build índex=$index · ${pokemon.name} · '
      'dataset=${kD2Pokes.length}',
    );
    return Day2PokeCard(pokemon: pokemon);
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.titleSmall;
    final surface = Theme.of(context).colorScheme.surfaceContainerHighest;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder / Column'),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: _outer,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final h = min(_kMaxCombinedListsHeight, constraints.maxHeight);
              return Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: h,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ColoredBox(
                        color: surface,
                        child: Padding(
                          padding: _section,
                          child: Text('ListView.builder', style: headerStyle),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: _list,
                          itemCount: kD2Pokes.length,
                          itemBuilder: (context, index) {
                            return _item(
                              'ListView.builder (lazy load)',
                              index,
                              kD2Pokes[index],
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 1),
                      ),
                      ColoredBox(
                        color: surface,
                        child: Padding(
                          padding: _section,
                          child: Text(
                            'SingleChildScrollView + Column',
                            style: headerStyle,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: _list,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (var i = 0; i < kD2Pokes.length; i++)
                                _item('Column', i, kD2Pokes[i]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
