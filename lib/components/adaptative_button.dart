import 'dart:io';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () => onPressed,
            color: Theme.of(context).colorScheme.primary,
            child: Text(label),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ))
        : ElevatedButton(
            onPressed: () => onPressed,
            style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.purple,
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            child: Text(label),
          );
  }
}
