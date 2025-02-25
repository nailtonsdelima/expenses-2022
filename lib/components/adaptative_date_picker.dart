import 'dart:io';
// import 'package:flutter/Cupertino.dart';
import 'package:flutter/Cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
      // setState(() {
      //   _selectedDate = pickedDate;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        // ignore: sized_box_for_whitespace
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    'Selecionada Data',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
