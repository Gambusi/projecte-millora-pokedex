import 'package:flutter/material.dart';

class StackBadgeScreen extends StatelessWidget {
  const StackBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack i superposició')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Patró 1: alignment',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Color(0xFFF8D030),
                    child: Text(
                      'P',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: -10,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Patró 2: Positioned (número discret)',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const Center(child: Text('Àrea de sprite')),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        '#025',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.45),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
