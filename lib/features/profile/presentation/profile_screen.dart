import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_curs/features/profile/domain/profile_form_data_model.dart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kProfileForm = 'profile_form';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  String _name = '';
  String _email = '';
  XFile? _file;
  Uint8List? _imageBytes;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final raw = await _prefs.getString(_kProfileForm);
    if (!mounted || raw == null) return;

    final data = ProfileFormData.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
    setState(() {
      _name = data.name;
      _email = data.email;
      _imageBytes = data.imageBase64 != null
          ? base64Decode(data.imageBase64!)
          : null;
      _saved = true;
    });
  }

  Future<void> _persistProfile() async {
    String? imageBase64;
    if (_file != null) {
      final bytes = await _file!.readAsBytes();
      imageBase64 = base64Encode(bytes);
    } else if (_imageBytes != null) {
      imageBase64 = base64Encode(_imageBytes!);
    }

    await _prefs.setString(
      _kProfileForm,
      jsonEncode(
        ProfileFormData(
          name: _name,
          email: _email,
          imageBase64: imageBase64,
        ).toJson(),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_file != null) {
      _imageBytes = await _file!.readAsBytes();
    }

    await _persistProfile();

    if (!mounted) return;
    setState(() => _saved = true);
  }

  Widget _buildSavedImage() {
    if (_file != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(_file!.path),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    if (_imageBytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          _imageBytes!,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: 300,
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
                    onSaved: (value) => _name = value ?? '',
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
                    onSaved: (value) => _email = value ?? '',
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  FormField<XFile?>(
                    validator: (_) {
                      if (_file == null && _imageBytes == null) {
                        return 'La imatge és obligatòria';
                      }
                      return null;
                    },
                    builder: (field) {
                      Future<void> pick(ImageSource source) async {
                        final file = await _picker.pickImage(source: source);
                        if (!mounted || file == null) return;
                        setState(() {
                          _file = file;
                          _imageBytes = null;
                          _saved = false;
                        });
                        field.didChange(file);
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton.icon(
                                  onPressed: () => pick(ImageSource.gallery),
                                  icon: const Icon(
                                    Icons.photo_library_outlined,
                                  ),
                                  label: const Text('Galeria'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FilledButton.tonalIcon(
                                  onPressed: () => pick(ImageSource.camera),
                                  icon: const Icon(Icons.photo_camera_outlined),
                                  label: const Text('Càmera'),
                                ),
                              ),
                            ],
                          ),
                          if (field.hasError)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                field.errorText!,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          if (_file != null) ...[
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_file!.path),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: _save, child: const Text('Save')),
                  if (_saved) ...[
                    const SizedBox(height: 16),
                    Text('Nom: $_name'),
                    Text('Email: $_email'),
                    if (_file != null || _imageBytes != null) ...[
                      const SizedBox(height: 8),
                      _buildSavedImage(),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
