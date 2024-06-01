import 'package:flutter/material.dart';
import 'package:lifting_progress_tracker/core/constants/localization.dart';

class DeleteDialog extends StatelessWidget {
  final String subject;
  final VoidCallback onConfirm;

  const DeleteDialog({
    required this.subject,
    required this.onConfirm,
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
          onPressed: () {
            onConfirm();
            Navigator.pop(context, 'ok');
          },
          child: const Text(dialogConfirm),
        ),
      ],
    );
  }
}
