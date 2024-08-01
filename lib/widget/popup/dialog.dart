import 'package:flutter/material.dart';

Future<String?> showInfoDialog({
  required BuildContext context,
  required String message,
}) {
  final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('ข้อความแจ้งเตือน'),
      titleTextStyle: textTheme.titleMedium,
      icon: const Icon(
        Icons.info,
        size: 36,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(message),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'ตกลง'),
          child: const Text('ตกลง'),
        ),
      ],
    ),
  );
}
