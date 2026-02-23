import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransaction});

  final List<Transaction> recentTransaction;

  //Generats a List with fixed 7 elements, with dynamic values
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      //based on today, sets weekDay
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final weekDayFirstLetter = DateFormat.E().format(weekDay)[0];

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(weekDayFirstLetter);
      print(totalSum);

      return {'day': weekDayFirstLetter, 'value': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[Text(' gráfico')]),
    );
  }
}
