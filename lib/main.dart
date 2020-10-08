import 'package:flutter/material.dart';
import 'package:flutter_despesas/components/transaction_form.dart';
import 'package:flutter_despesas/components/transaction_list.dart';
import 'package:flutter_despesas/components/transaction_user.dart';
import 'package:flutter_despesas/models/transaction.dart';

main () => runApp( DespesasApp() );

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
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
          TransactionUser(),
        ],
      ),
    );
  }
}
