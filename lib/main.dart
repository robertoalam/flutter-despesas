import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_despesas/components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main () => runApp( DespesasApp() );

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        ),
      ),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final List<Transaction> _transaction = [
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Sobretudo',
      value: 109.99 ,
      date: DateTime.now().subtract(Duration(days: 11)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Jaqueta',
      value: 299.99 ,
      date: DateTime.now().subtract(Duration(days: 10)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Jaqueta',
      value: 199.99 ,
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Calça Zoomp',
      value: 199.99 ,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Meia Adidas',
      value: 19.99 ,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Boné',
      value: 14.99 ,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Calca Moleton',
      value: 29.99 ,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
        id: new Random().nextDouble().toString(),
        title: 'Tenis Fila',
        value: 299.25 ,
        date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Cuecas 6',
      value: 19.50 ,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Meias 6',
      value: 14.50 ,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Camiseta',
      value: 34.50 ,
      date: DateTime.now().subtract(Duration(days: 0)),
    ),
  ];

  List<Transaction> get _recentTransaction {
    return _transaction.where((tr){
      return tr.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          )
      );
    }).toList();
  }

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
        title: Text("Despesas",
            style: TextStyle(
              fontFamily: 'OpenSans'
            ),
        ),
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
          // Container(
          //   child: Card(
          //     color: Colors.purple,
          //     child: Text("GRAFICO"),
          //     elevation: 5,
          //   ),
          // ),
          Chart(_recentTransaction),
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
