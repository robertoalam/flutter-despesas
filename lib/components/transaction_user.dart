import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_despesas/components/transaction_form.dart';
import 'package:flutter_despesas/components/transaction_list.dart';
import 'package:flutter_despesas/models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transaction = [
    Transaction(
        id:'1',
        title: 'Tenis',
        value: 111.25 ,
        date: DateTime.now()
    ),
    Transaction(
        id:'2',
        title: 'Calca',
        value: 29.99 ,
        date: DateTime.now()
    ),
  ];


  _adicionarTransaction(String titulo , double valor){
    final novaTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        title: titulo,
        value: valor,
        date: DateTime.now()
    );

    setState(() {
      _transaction.add(novaTransaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transaction),
        TransactionForm(),
      ],
    );
  }
}
