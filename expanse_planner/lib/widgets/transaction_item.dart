import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();
    const availableColors = [
      Color.fromARGB(255, 28, 17, 10),
      Color.fromARGB(255, 228, 214, 167),
      Color.fromARGB(255, 233, 180, 76),
      Color.fromARGB(255, 155, 41, 21),
      Color.fromARGB(255, 80, 162, 167)
    ];
    _bgColor = availableColors[Random().nextInt(5)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('Ŕ\$${widget.transaction.amount}'),
            ),
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('DELETE'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}
