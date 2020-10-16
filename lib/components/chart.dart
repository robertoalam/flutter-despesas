import 'package:flutter/material.dart';
import 'package:flutter_despesas/components/chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction ;

  Chart(this.recentTransaction);

  List<Map<String,Object>> get groupedTransactions{

    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for(var i = 0 ; i < recentTransaction.length ; i++){
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;
        if( sameDay && sameMonth && sameYear){
          totalSum += recentTransaction[i].value;
        }
      }

      // print( DateFormat.E().format(weekDay)[0] );
      // print( DateFormat(DateFormat.WEEKDAY, 'pt_Br').format( weekDay )[0].toUpperCase()  );
      // print( totalSum );

      return {
        //'day':DateFormat.E().format(weekDay)[0] ,
        'day': DateFormat(DateFormat.WEEKDAY, 'pt_Br').format( weekDay )[0].toUpperCase(),
        'value': totalSum
      };
    }).reversed.toList();
  }

  double get _weekTotalValor{
    return groupedTransactions.fold(0.0 , (sum , tr){
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactions.map((tr) {
            return Flexible(
                fit:FlexFit.tight,
                child: ChartBar(
                    label: tr['day'] ,
                    value: tr['value'] ,
                    percentage: _weekTotalValor == 0 ? 0 : (tr['value'] as double) / _weekTotalValor
                )
            );
          }).toList(),
        ),
      ),
    );
  }
}
