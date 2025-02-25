import 'dart:io';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdaptativeButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            onPressed: () => onPressed,
            child: Text(label),
          )
        : ElevatedButton(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.purple,
              ),
            ),
            onPressed: () => onPressed,
            // style: ElevatedButton.styleFrom(
            //     // backgroundColor: Colors.purple,
            //     backgroundColor: Theme.of(context).colorScheme.primary,
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     textStyle: const TextStyle(
            //       fontSize: 20,
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     )),
          );
  }
}
