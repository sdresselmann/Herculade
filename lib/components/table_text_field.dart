import 'package:flutter/material.dart';

class TableTextField extends StatelessWidget {
  final String textFieldValue;

  const TableTextField(this.textFieldValue);

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: TextEditingController(text: textFieldValue),
      focusNode: FocusNode(),
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.orange,
      backgroundCursorColor: Colors.green,
    );
  }
}
