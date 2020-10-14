import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 346,
      //height: MediaQuery.of(context).size.height,
      child: transaction.isEmpty?
      Column(
        children: [
          SizedBox(height: 20,),
          Text("Nenhuma Transacao Cadastrada!" , style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child:Image.asset('assets/images/waiting.png' , fit: BoxFit.cover,),
          ),
        ],
      )
      :
      ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (context , index){
          final tr = transaction[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "R\$ ${tr.value.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                      //style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd/MM/y').format(tr.date),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
