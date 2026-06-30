import 'package:flutter/material.dart';

class NotificationsDialogScreen extends StatefulWidget {
  const NotificationsDialogScreen({super.key});

  @override
  State<NotificationsDialogScreen> createState() =>
      _NotificationsDialogScreenState();
}

class _NotificationsDialogScreenState extends State<NotificationsDialogScreen> {
  String _threeChoicesParen = 'cap encara';

  Future<void> _showSimpleDismissible(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Avís'),
          content: const Text(
            'Es pot tancar tocant «D\'acord», enrere del sistema o tocant '
            'fora del quadre.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('D\'acord'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMustChooseOption(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text('Confirmació obligatòria'),
            content: const Text(
              'No es pot tancar enrere ni tocant fora. Has de triar una opció.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Sí'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showThreeChoicesDismissible(BuildContext context) async {
    final picked = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tria una opció'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Pots tancar sense triar (fora del diàleg o «Cancel·la»). '
                  'Si tries una fila, es retorna el valor.',
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () => Navigator.of(context).pop<String>('opció A'),
                  child: const Text('Opció A'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => Navigator.of(context).pop<String>('opció B'),
                  child: const Text('Opció B'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () => Navigator.of(context).pop<String>('opció C'),
                  child: const Text('Opció C'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop<String>(),
              child: const Text('Cancel·la'),
            ),
          ],
        );
      },
    );

    setState(() {
      _threeChoicesParen = picked ?? 'sense selecció';
    });
  }

  @override
  Widget build(BuildContext context) {
    final threeLabel = '3 · Dismissible, 3 opcions ($_threeChoicesParen)';

    return Scaffold(
      appBar: AppBar(title: const Text('Diàlegs i notificacions')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => _showSimpleDismissible(context),
              child: const Text('1 · Alerta dismissible'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => _showMustChooseOption(context),
              child: const Text('2 · Alerta NO dismissible — cal triar'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => _showThreeChoicesDismissible(context),
              child: Text(threeLabel),
            ),
          ],
        ),
      ),
    );
  }
}
