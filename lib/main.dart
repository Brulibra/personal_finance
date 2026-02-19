import 'package:flutter/material.dart';
import 'package:personal_finance/components/transaction_user.dart';

void main() => runApp(FinanceApp());

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: <Widget>[
            SizedBox(child: Card(elevation: 5, child: Text('Gráfico'))),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
