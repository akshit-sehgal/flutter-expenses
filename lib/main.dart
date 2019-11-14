import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Mobile Phone',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shoes',
      amount: 250,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Food',
      amount: 100,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Charts'),
              elevation: 5,
            ),
            width: double.infinity,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: (){},
                  )
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              ...(transactions
                  .map((transaction) => Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.purple,
                              )),
                              child: Text('\$ ${transaction.amount}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple,
                                  )),
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transaction.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(transaction.date),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList())
            ],
          ),
        ],
      ),
    );
  }
}
