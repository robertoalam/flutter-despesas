import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  TransactionList(this.transaction , this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty?
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
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8 , horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Text("R\$${tr.value}"),
                  ),
                ),
              ),
              title: Text(
                tr.title ,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                  DateFormat('dd/MM/y').format(tr.date)
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(tr.id),
              ),
            ),
          );
        },
      );
  }
}