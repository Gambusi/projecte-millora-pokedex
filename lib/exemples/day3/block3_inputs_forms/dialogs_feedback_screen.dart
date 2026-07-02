import 'package:flutter/material.dart';

class DialogsFeedbackScreen extends StatefulWidget {
  const DialogsFeedbackScreen({super.key});

  @override
  State<DialogsFeedbackScreen> createState() => _DialogsFeedbackScreenState();
}

class _DialogsFeedbackScreenState extends State<DialogsFeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';

  Future<void> _confirmAndSend() async {
    if (_formKey.currentState?.validate() != true) return;
    final title = _title.trim();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar enviament'),
        content: Text('Vols enviar «$title»?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel·lar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Enviar'),
          ),
        ],
      ),
    );

    if (!mounted || confirmed != true) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Enviat: $title'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diàlegs i feedback')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              onChanged: (v) => _title = v,
              decoration: const InputDecoration(
                labelText: 'Títol de la incidència',
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final t = v?.trim() ?? '';
                if (t.isEmpty) return 'El títol no pot estar buit.';
                if (t.length < 3) {
                  return 'El títol ha de tenir almenys 3 caràcters.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _confirmAndSend,
              icon: const Icon(Icons.send),
              label: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
