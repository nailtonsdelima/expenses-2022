import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'adaptative_button.dart';
import 'adaptative_text_field.dart';

import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  // TransactionForm({Key? key}) : super(key: key);
  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    // ignore: unnecessary_null_comparison
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  // Função está sendo levada para o novo componente date picker
  // ignore: unused_element
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          // padding: const EdgeInsets.all(10),
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 * MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (value) => _submitForm(),
                // keyBoardType: TextInputType.text,
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyBoardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // AdaptativeButton(
                  //   onPressed: _submitForm,
                  //   label: 'Nova Transação',
                  // ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
