import 'package:flutter/material.dart';

class TableTextField extends StatefulWidget {
  final String textFieldValue;
  const TableTextField(this.textFieldValue);

  @override
  State<StatefulWidget> createState() => _TableTextFieldState();
}

class _TableTextFieldState extends State<TableTextField> {
  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: TextEditingController(text: widget.textFieldValue),
      focusNode: FocusNode(),
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.orange,
      backgroundCursorColor: Colors.green,
    );
  }
}
