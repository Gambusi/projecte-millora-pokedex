import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final _formKey = GlobalKey<FormState>();

  String _savedName = '';
  String _savedEmail = '';
  String _savedNotes = '';

  String _savedSummary = '';

  void _submit() {
    final form = _formKey.currentState!;
    if (!form.validate()) return;
    form.save();
    setState(() {
      _savedSummary =
          ' \nNom: ${_savedName.trim()} \nEmail: ${_savedEmail.trim()}'
          '${_savedNotes.trim().isNotEmpty ? '\nNotes: ${_savedNotes.trim()}' : ''}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form i validadors')),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'El nom és obligatori.';
                }
                if (v.trim().length < 2) {
                  return 'Massa curt (mín. 2 caràcters).';
                }
                return null;
              },
              onSaved: (v) => _savedName = v ?? '',
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'L’email és obligatori.';
                }
                final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(v.trim());
                if (!ok) return 'Format d’email no vàlid.';
                return null;
              },
              onSaved: (v) => _savedEmail = v ?? '',
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Notes (opcional)',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 3,
              validator: (v) {
                if (v != null && v.length > 120) {
                  return 'Màxim 120 caràcters.';
                }
                return null;
              },
              onSaved: (v) => _savedNotes = v ?? '',
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _submit,
              child: const Text('Validar i desar (onSaved)'),
            ),
            if (_savedSummary.isNotEmpty) ...[
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  title: const Text('Últim guardat vàlid'),
                  subtitle: Text(_savedSummary),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
