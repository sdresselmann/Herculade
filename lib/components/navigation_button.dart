import 'package:flutter/material.dart';

ElevatedButton getNavigationButton(
  BuildContext context,
  Function(BuildContext context) navigationFunction,
  String buttonText,
) {
  final ElevatedButton elevatedButton = ElevatedButton(
    onPressed: () => navigationFunction(context),
    child: Text(buttonText),
  );
  return elevatedButton;
}
