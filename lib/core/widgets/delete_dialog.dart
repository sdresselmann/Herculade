import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';

class DeleteDialog<T extends GetxController> extends StatelessWidget {
  final String subject;
  final T controller;
  final void Function(T controller, BuildContext context) okCallback;

  const DeleteDialog({
    required this.subject,
    required this.controller,
    required this.okCallback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(deleteDialogTitle),
      content: Text("$deleteDialogContent $subject"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, "cancel"),
          child: const Text(dialogCancel),
        ),
        TextButton(
          onPressed: () => okCallback(controller, context),
          child: const Text(dialogConfirm),
        ),
      ],
    );
  }
}
