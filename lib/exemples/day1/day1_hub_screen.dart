import 'package:flutter/material.dart';

import 'pass_data_screen.dart';
import 'variables_screen.dart';
import 'var_final_screen.dart';
import 'null_safety_screen.dart';
import 'collections_screen.dart';
import 'functions_screen.dart';
import 'async_screen.dart';
import 'records_screen.dart';
import 'pattern_matching_screen.dart';
import 'enhanced_enums_screen.dart';
import 'widgets/root_hub.dart';

/// Punt d’entrada dels exemples del dia 1.
class Day1HubScreen extends StatelessWidget {
  const Day1HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day1RootHub(
      title: 'Dia 1 · Exemples',
      items: [
        Day1DemoItem(
          title: 'Passar dades al widget fill',
          subtitle: 'Constructor i paràmetres',
          screen: PassDataScreen(),
        ),
        Day1DemoItem(
          title: 'Variables i tipus bàsics',
          subtitle: 'String, int, double, bool',
          screen: VariablesScreen(),
        ),
        Day1DemoItem(
          title: 'var, final, const i late',
          subtitle: 'Com es declaren i quan canvien',
          screen: VarFinalScreen(),
        ),
        Day1DemoItem(
          title: 'Null safety',
          subtitle: '?., ??, String i String?',
          screen: NullSafetyScreen(),
        ),
        Day1DemoItem(
          title: 'Col·leccions',
          subtitle: 'Llistes, spread, Map, where',
          screen: CollectionsScreen(),
        ),
        Day1DemoItem(
          title: 'Funcions',
          subtitle: 'Arrow, paràmetres amb nom, required',
          screen: FunctionsScreen(),
        ),
        Day1DemoItem(
          title: 'async i await',
          subtitle: 'Future i codi asíncron',
          screen: AsyncScreen(),
        ),
        Day1DemoItem(
          title: 'Records',
          subtitle: 'Més d’un valor de retorn',
          screen: RecordsScreen(),
        ),
        Day1DemoItem(
          title: 'Pattern matching',
          subtitle: 'switch com a expressió amb intervals',
          screen: PatternMatchingScreen(),
        ),
        Day1DemoItem(
          title: 'Enums',
          subtitle: 'Enum simple i enum avançat',
          screen: EnhancedEnumsScreen(),
        ),
      ],
    );
  }
}
