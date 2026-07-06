import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kVisits = 'demo_visit_count',
    _kNickname = 'demo_nickname',
    _kTips = 'demo_show_tips';
const _demoKeys = {_kVisits, _kNickname, _kTips};

class SharedPreferencesDemoScreen extends StatefulWidget {
  const SharedPreferencesDemoScreen({super.key});

  @override
  State<SharedPreferencesDemoScreen> createState() =>
      _SharedPreferencesDemoScreenState();
}

class _SharedPreferencesDemoScreenState
    extends State<SharedPreferencesDemoScreen> {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  final _nickCtrl = TextEditingController();

  int _visits = 0;
  bool _showTips = true;

  @override
  void initState() {
    super.initState();
    _reloadStateFromPrefs();
  }

  Future<void> _reloadStateFromPrefs() async {
    final visits = await _prefs.getInt(_kVisits);
    final nick = await _prefs.getString(_kNickname);
    final tips = await _prefs.getBool(_kTips);
    if (!mounted) return;
    setState(() {
      _visits = visits ?? 0;
      _nickCtrl.text = nick ?? '';
      _showTips = tips ?? true;
    });
  }

  Future<void> _bumpVisits() async {
    final v = _visits + 1;
    await _prefs.setInt(_kVisits, v);
    setState(() => _visits = v);
  }

  Future<void> _saveNickname() async {
    await _prefs.setString(_kNickname, _nickCtrl.text.trim());
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sobrenom ${_nickCtrl.text.trim()} desat')),
    );
  }

  Future<void> _setShowTips(bool v) async {
    await _prefs.setBool(_kTips, v);
    setState(() => _showTips = v);
  }

  Future<void> _clearDemo() async {
    await _prefs.clear(allowList: _demoKeys);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Claus demo esborrades')));
    await _reloadStateFromPrefs();
  }

  @override
  void dispose() {
    _nickCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SharedPreferences')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              title: const Text('Visites (int)'),
              subtitle: Text('Valor persistit: $_visits'),
              trailing: FilledButton(
                onPressed: _bumpVisits,
                child: const Text('+1'),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nickCtrl,
            decoration: const InputDecoration(
              labelText: 'Sobrenom (String)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.tonal(
              onPressed: _saveNickname,
              child: const Text('Desar sobrenom'),
            ),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Mostrar consells (bool)'),
            value: _showTips,
            onChanged: _setShowTips,
          ),
          if (_showTips)
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const ListTile(
                leading: Icon(Icons.lightbulb_outline),
                title: Text('Centralitza les claus en constants'),
              ),
            ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: _clearDemo,
            icon: const Icon(Icons.delete_outline),
            label: const Text('Esborrar només les claus demo'),
          ),
        ],
      ),
    );
  }
}
