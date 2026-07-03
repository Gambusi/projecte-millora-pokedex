import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _nameController = '';
  String _emailController = '';

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nom és obligatori';
                    }
                    return null;
                  },
                  onSaved: (value) => _nameController = value ?? '',
                  decoration: const InputDecoration(labelText: 'Nom'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'L\'email és obligatori';
                    }
                    RegExp emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'L\'email no és vàlid';
                    }
                    return null;
                  },
                  onSaved: (value) => _emailController = value ?? '',
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(onPressed: _save, child: const Text('Save')),
                if (_nameController.isNotEmpty && _emailController.isNotEmpty)
                  Column(
                    children: [
                      Text('Nom: $_nameController'),
                      Text('Email: $_emailController'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
