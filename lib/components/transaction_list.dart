import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  // SizedBox(height: constraints.maxHeight * 0.05),
                  const SizedBox(height: 20),
                  // ignore: sized_box_for_whitespace
                  Text(
                    'Nenhuma transação cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  // SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    // height: 200,
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          label: const Text('Excluir'),
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                          // textColor: Theme.of(context).colorScheme.error,
                          // textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       // ignore: avoid_unnecessary_containers
              //       Container(
              //         margin: const EdgeInsets.symmetric(
              //             horizontal: 15, vertical: 10),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).colorScheme.primary,
              //             width: 2,
              //           ),
              //         ),
              //         padding: const EdgeInsets.all(10),
              //         child: Text(
              //           // tr.value.toString(),
              //           'R\$ ${tr.value.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).colorScheme.primary,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             tr.title,
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             // tr.date.toString(),
              //             DateFormat('d MMM y').format(tr.date),
              //             style: const TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
          );
  }
}
