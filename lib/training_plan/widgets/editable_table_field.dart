import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:lifting_progress_tracker/core/constants/timer.dart';

class EditableTableField extends StatelessWidget {
  final Rx<String> _userInput = "".obs;
  final String initialValue;

  EditableTableField({required this.initialValue});

  @override
  Widget build(BuildContext context) {
    setupDebounce();

    return TextFormField(
      initialValue: initialValue,
      onChanged: (String changedInput) {
        _userInput.value = changedInput;
      },
    );
  }

  void setupDebounce() {
    debounce(
      _userInput,
      (String input) {},
      time: const Duration(milliseconds: textFieldDebounceTime),
    );
  }
}
