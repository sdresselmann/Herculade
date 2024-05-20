import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:lifting_progress_tracker/core/constants/timer.dart';

class EditableTableField extends StatelessWidget {
  final Rx<String> _userInput;
  final String initialValue;

  EditableTableField({super.key, required this.initialValue})
      : _userInput = initialValue.obs;

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
        // Do callback on user input
      },
      time: const Duration(milliseconds: textFieldDebounceTime),
    );
  }
}
