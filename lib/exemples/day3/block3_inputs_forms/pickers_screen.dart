import 'package:flutter/material.dart';

class PickersScreen extends StatefulWidget {
  const PickersScreen({super.key});

  @override
  State<PickersScreen> createState() => _PickersScreenState();
}

class _PickersScreenState extends State<PickersScreen> {
  DateTime? _date;
  TimeOfDay? _time;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (!mounted || picked == null) return;
    setState(() => _date = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
    );
    if (!mounted || picked == null) return;
    setState(() => _time = picked);
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = _date == null
        ? 'Encara no seleccionada'
        : MaterialLocalizations.of(context).formatFullDate(_date!);
    final timeStr = _time == null
        ? 'Encara no seleccionada'
        : _time!.format(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pickers')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: const Text('Data'),
            subtitle: Text(dateStr),
            trailing: const Icon(Icons.calendar_month),
            onTap: _pickDate,
          ),
          ListTile(
            title: const Text('Hora'),
            subtitle: Text(timeStr),
            trailing: const Icon(Icons.schedule),
            onTap: _pickTime,
          ),
        ],
      ),
    );
  }
}
