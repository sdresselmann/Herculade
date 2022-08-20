import 'package:flutter/material.dart';

class TableTextField extends StatefulWidget {
  /// Text value inside of the edit text widget.
  final String textFieldValue;

  /// Function callback that is executed once text has been entered and the input
  /// has been confirmed by pressing enter.
  final Function(String) onEditingComplete;

  const TableTextField(
      {required this.textFieldValue, required this.onEditingComplete});

  @override
  State<StatefulWidget> createState() => _TableTextFieldState();
}

class _TableTextFieldState extends State<TableTextField> {
  /// Controller used for accessing the text data of the field.
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.textFieldValue);
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: _textController,
      focusNode: FocusNode(),
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.orange,
      backgroundCursorColor: Colors.green,
      onEditingComplete: () => widget.onEditingComplete(_textController.text),
    );
  }
}
