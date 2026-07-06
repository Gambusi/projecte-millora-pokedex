import 'package:flutter/material.dart';

import 'package:flutter_curs/exemples/day3/widgets/block_hub.dart';
import 'shared_preferences_demo_screen.dart';
import 'shared_preferences_form_model_screen.dart';

class Day4B2HubScreen extends StatelessWidget {
  const Day4B2HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'SharedPreferences',
      items: [
        Day3DemoItem(
          title: 'Primitives (int, String, bool)',
          subtitle:
              'get/set per clau, visites, sobrenom i switch amb claus separades.',
          screen: SharedPreferencesDemoScreen(),
        ),
        Day3DemoItem(
          title: 'Form + model JSON',
          subtitle:
              'Formulari amb onSaved, DemoProfileEntry, jsonEncode i llista persistida.',
          screen: SharedPreferencesFormModelScreen(),
        ),
      ],
    );
  }
}
