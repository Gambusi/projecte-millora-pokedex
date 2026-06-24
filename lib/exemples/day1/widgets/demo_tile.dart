import 'package:flutter/material.dart';

class Day1DemoTile extends StatelessWidget {
  const Day1DemoTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(
          context,
        ).push<void>(MaterialPageRoute<void>(builder: (_) => screen));
      },
    );
  }
}
