import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const AdaptativeButton(
      {required this.onPressed, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(label),
          );
  }
}
