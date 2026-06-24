import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  bool _loading = false;
  String? _result;

  Future<String> _fetchPokemonName() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return 'MewtwoNew';
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _result = null;
    });
    final name = await _fetchPokemonName();
    if (mounted) {
      setState(() {
        _result = name;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('async / await')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'await dins d’una funció async. El nom apareix a sota quan acaba la petició simulada.',
              style: theme.bodyLarge,
            ),
            const SizedBox(height: 24),
            if (_loading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_result != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pokemon', style: theme.titleSmall),
                      const SizedBox(height: 8),
                      Text(_result!, style: theme.headlineMedium),
                    ],
                  ),
                ),
              )
            else
              Text(
                'Prem el botó per carregar.',
                style: theme.bodyMedium?.copyWith(
                  color: theme.bodySmall?.color,
                ),
              ),
            const Spacer(),
            FilledButton.icon(
              onPressed: _loading ? null : _load,
              icon: const Icon(Icons.download),
              label: Text(_loading ? 'Carregant…' : 'Carregar dades'),
            ),
          ],
        ),
      ),
    );
  }
}
