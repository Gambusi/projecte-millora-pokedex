import 'package:flutter/material.dart';

class SelectionInputsScreen extends StatefulWidget {
  const SelectionInputsScreen({super.key});

  @override
  State<SelectionInputsScreen> createState() => _SelectionInputsScreenState();
}

class _SelectionInputsScreenState extends State<SelectionInputsScreen> {
  final _formKey = GlobalKey<FormState>();
  static const _regions = ['Barcelona', 'Girona', 'Lleida', 'Tarragona'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controls de selecció')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            FormField<String>(
              validator: (v) => v == null ? 'Tria una regió.' : null,
              builder: (state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Regió',
                    border: const OutlineInputBorder(),
                    errorText: state.errorText,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Selecciona'),
                      value: state.value,
                      items: [
                        for (final r in _regions)
                          DropdownMenuItem(value: r, child: Text(r)),
                      ],
                      onChanged: state.didChange,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            FormField<bool>(
              initialValue: false,
              validator: (v) =>
                  v == true ? null : 'Cal confirmar la política de dades.',
              builder: (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckboxListTile(
                      title: const Text('Accepto el tractament de dades'),
                      value: state.value ?? false,
                      onChanged: (b) => state.didChange(b ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    if (state.hasError)
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          state.errorText!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            FormField<double>(
              initialValue: 12,
              validator: (v) {
                if (v == null) return null;
                if (v < 8) return 'Mínim 8 hores.';
                return null;
              },
              builder: (state) {
                final hours = state.value ?? 12;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hores estimades: ${hours.round()}'),
                    Slider(
                      value: hours,
                      min: 4,
                      max: 40,
                      divisions: 36,
                      label: '${hours.round()} h',
                      onChanged: (x) => state.didChange(x),
                    ),
                    if (state.hasError)
                      Text(
                        state.errorText!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                final ok = _formKey.currentState!.validate();
                if (!ok) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulari vàlid')),
                );
              },
              child: const Text('Validar seleccions'),
            ),
          ],
        ),
      ),
    );
  }
}
