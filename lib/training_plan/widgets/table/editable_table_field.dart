import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:lifting_progress_tracker/core/constants/timer.dart';

class EditableTableField extends StatelessWidget {
  final Rx<String> _userInput;

  final String initialValue;
  final ValueChanged<String> onChanged;

  EditableTableField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  }) : _userInput = initialValue.obs;

  @override
  Widget build(BuildContext context) {
    _setupDebounce();

    return TextFormField(
      initialValue: initialValue,
      onChanged: (String changedInput) {
        _userInput.value = changedInput;
      },
    );
  }

  void _setupDebounce() {
    debounce(
      _userInput,
      (String input) {
        onChanged(
          input,
        );
      },
      time: const Duration(milliseconds: textFieldDebounceTime),
    );
  }
}
