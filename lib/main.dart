import 'dart:math';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main () => runApp( DespesasApp() );

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_){
          return TransactionForm( _adicionarTransaction );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.purple,
              child: Text("GRAFICO"),
              elevation: 5,
            ),
          ),
          TransactionList(_transaction),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
