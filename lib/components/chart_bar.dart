import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartBar extends StatelessWidget {
  String label;
  double value;
  double percentage;

  ChartBar(
      {Key? key,
      required this.label,
      required this.value,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value.toStringAsFixed(2)}'),
        const SizedBox(height: 5),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
