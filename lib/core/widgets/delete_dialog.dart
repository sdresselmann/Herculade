import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDialog<T extends GetxController> extends StatelessWidget {
  final T controller;
  final void Function(T controller, BuildContext context) okCallback;

  const DeleteDialog({
    required this.controller,
    required this.okCallback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete?"),
      content: const Text("Confirm deletion of the row."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, "cancel"),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => okCallback(controller, context),
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
