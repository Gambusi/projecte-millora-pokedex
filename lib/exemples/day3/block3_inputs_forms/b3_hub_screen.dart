import 'package:flutter/material.dart';

import '../widgets/block_hub.dart';
import 'advanced_fields_screen.dart';
import 'dialogs_feedback_screen.dart';
import 'form_validation_screen.dart';
import 'image_picker_screen.dart';
import 'pickers_screen.dart';
import 'selection_inputs_screen.dart';

class Day3B3HubScreen extends StatelessWidget {
  const Day3B3HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Dia 3 · Bloc 3 · Formularis i inputs',
      items: [
        Day3DemoItem(
          title: 'Form, GlobalKey i validadors',
          subtitle:
              'TextFormField, validate/save, AutovalidateMode.onUserInteraction.',
          screen: FormValidationScreen(),
        ),
        Day3DemoItem(
          title: 'Dropdown, checkbox i slider',
          subtitle:
              'FormField amb DropdownButton; checkbox i slider amb validació.',
          screen: SelectionInputsScreen(),
        ),
        Day3DemoItem(
          title: 'Camps avançats',
          subtitle:
              'Obscure toggle, prefix/suffix, formatters, readOnly i counter.',
          screen: AdvancedFieldsScreen(),
        ),
        Day3DemoItem(
          title: 'Date i time pickers',
          subtitle:
              'showDatePicker / showTimePicker i comprovar mounted després del Future.',
          screen: PickersScreen(),
        ),
        Day3DemoItem(
          title: 'Image picker',
          subtitle:
              'Galeria i càmera amb image_picker; vista prèvia en memòria i retrieveLostData.',
          screen: ImagePickerScreen(),
        ),
        Day3DemoItem(
          title: 'Diàlegs i bottom sheet',
          subtitle:
              'AlertDialog d’errors i confirmació, SnackBar i showModalBottomSheet.',
          screen: DialogsFeedbackScreen(),
        ),
      ],
    );
  }
}
