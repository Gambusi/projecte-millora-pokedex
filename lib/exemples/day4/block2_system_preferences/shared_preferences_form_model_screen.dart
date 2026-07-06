import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_profile_entry.dart';

const _kProfileEntries = 'demo_profile_entries';

class SharedPreferencesFormModelScreen extends StatefulWidget {
  const SharedPreferencesFormModelScreen({super.key});

  @override
  State<SharedPreferencesFormModelScreen> createState() =>
      _SharedPreferencesFormModelScreenState();
}

class _SharedPreferencesFormModelScreenState
    extends State<SharedPreferencesFormModelScreen> {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  final _formKey = GlobalKey<FormState>();

  String _formNickname = '';
  String _formVisits = '0';
  bool _showTips = true;

  List<DemoProfileEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final raw = await _prefs.getString(_kProfileEntries);
    if (!mounted) return;
    if (raw == null) {
      setState(() => _entries = []);
      return;
    }

    final decoded = jsonDecode(raw) as List<dynamic>;
    setState(() {
      _entries = decoded
          .map((e) => DemoProfileEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> _persistEntries() async {
    final jsonList = _entries.map((e) => e.toJson()).toList();
    await _prefs.setString(_kProfileEntries, jsonEncode(jsonList));
  }

  Future<void> _saveEntry() async {
    final form = _formKey.currentState!;
    if (!form.validate()) return;
    form.save();

    final entry = DemoProfileEntry(
      nickname: _formNickname,
      visits: int.parse(_formVisits),
      showTips: _showTips,
    );

    setState(() {
      _entries = [..._entries, entry];
      _showTips = true;
    });
    form.reset();
    await _persistEntries();

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Perfil "${entry.nickname}" afegit a la llista')),
    );
  }

  Future<void> _clearEntries() async {
    await _prefs.remove(_kProfileEntries);
    if (!mounted) return;
    setState(() => _entries = []);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Llista de perfils esborrada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form + model JSON')),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            Text(
              'Mateixos camps que el demo primitiu, però com a formulari '
              'i desats com a llista de models (JSON).',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: '',
              decoration: const InputDecoration(
                labelText: 'Sobrenom (String)',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSaved: (v) => _formNickname = v?.trim() ?? '',
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'El sobrenom és obligatori.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: '0',
              decoration: const InputDecoration(
                labelText: 'Visites (int)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
              onSaved: (v) => _formVisits = v?.trim() ?? '0',
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Les visites són obligatòries.';
                }
                return null;
              },
            ),
            const SizedBox(height: 4),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Mostrar consells (bool)'),
              value: _showTips,
              onChanged: (v) => setState(() => _showTips = v),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _saveEntry,
              child: const Text('Validar i afegir a la llista'),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Text(
                  'Perfils desats (${_entries.length})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                if (_entries.isNotEmpty)
                  TextButton.icon(
                    onPressed: _clearEntries,
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Esborrar tot'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (_entries.isEmpty)
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.inbox_outlined,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  title: const Text('Cap perfil desat'),
                  subtitle: const Text(
                    'Omple el formulari i prem «Validar i afegir a la llista».',
                  ),
                ),
              )
            else
              ..._entries.asMap().entries.map((e) {
                final index = e.key;
                final entry = e.value;
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(entry.nickname),
                    subtitle: Text(
                      'Visites: ${entry.visits} · Consells: '
                      '${entry.showTips ? 'sí' : 'no'}',
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
