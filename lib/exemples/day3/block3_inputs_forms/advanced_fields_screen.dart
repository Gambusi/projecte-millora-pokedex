import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TripletHyphenDigitFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final capped = digits.length > 6 ? digits.substring(0, 6) : digits;
    final formatted = capped.length <= 3
        ? capped
        : '${capped.substring(0, 3)}-${capped.substring(3)}';
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class AdvancedFieldsScreen extends StatefulWidget {
  const AdvancedFieldsScreen({super.key});

  @override
  State<AdvancedFieldsScreen> createState() => _AdvancedFieldsScreenState();
}

class _AdvancedFieldsScreenState extends State<AdvancedFieldsScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camps avançats')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          TextField(
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Contrasenya',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                tooltip: _obscure ? 'Mostrar' : 'Amagar',
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TripletHyphenDigitFormatter(),
            ],
            maxLength: 7,
            buildCounter:
                (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) {
                  return Text('$currentLength / $maxLength');
                },
            decoration: const InputDecoration(
              labelText: 'Codi numèric (6 dígits)',
              border: OutlineInputBorder(),
              prefixText: '# ',
              helperText: 'Només dígits, format XXX-XXX.',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Camp desactivat',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
