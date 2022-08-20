import 'package:flutter/material.dart';

class TableTextField extends StatefulWidget {
  final String textFieldValue;
  const TableTextField(this.textFieldValue, this.callback);
  final Function(String) callback;

  @override
  State<StatefulWidget> createState() => _TableTextFieldState();
}

class _TableTextFieldState extends State<TableTextField> {
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
      onEditingComplete: () => widget.callback(_textController.text),
    );
  }
}
