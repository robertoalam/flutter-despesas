import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_despesas/components/chart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main () => runApp( DespesasApp() );

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      home: homePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      title: 'Mecanico',
      value: 899.99 ,
      date: DateTime.now().subtract(Duration(days: 11)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Sobretudo',
      value: 699.99 ,
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
      title: 'Ar condicionado',
      value: 1999.00 ,
      date: DateTime.now().subtract(Duration(days: 3)),
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
      title: 'TV 50',
      value: 3999.99 ,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Camiseta',
      value: 34.50 ,
      date: DateTime.now().subtract(Duration(days: 0)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Notebook',
      value: 4999.99 ,
      date: DateTime.now().subtract(Duration(days: 0)),
    ),
    Transaction(
      id: new Random().nextDouble().toString(),
      title: 'Mochila',
      value: 299.50 ,
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

  _adicionarTransaction(String titulo , double valor , DateTime date ){
    final novaTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        title: titulo,
        value: valor,
        date: date,
    );

    setState(() {
      _transaction.add(novaTransaction);
    });

    Navigator.of(context).pop();
  }

  _deletarTransaction(String id){
    setState(() {
      // DESSA FORMA
      _transaction.removeWhere((tr) => tr.id == id);

      // OU DA FORMA COMENTADA ABAIXO
      // _transaction.removeWhere((tr){
      //   return tr.id == id;
      // });

    });
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
    final appBar = AppBar(
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
    );

    final disponivelAltura = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: disponivelAltura * 0.3,
              child: Chart(_recentTransaction),
            ),
            Container(
              height: disponivelAltura * 0.7,
              child: TransactionList(_transaction , _deletarTransaction ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
