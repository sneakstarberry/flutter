import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'accountModel.dart';

class TestSLW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BankAccount bankAccount = Provider.of<BankAccount>(context);
    String name = Provider.of<String>(context);
  print("you pressed third page");

    return Scaffold(
      appBar: AppBar(title: Text("SFW with Provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your Name is '$name'"),
            Text("Your balance is ${bankAccount.getBalance()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+1"),
                  onPressed: () {
                    bankAccount.increment(1);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+10"),
                  onPressed: () {
                    bankAccount.increment(10);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("+100"),
                  onPressed: () {
                    bankAccount.increment(100);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-1"),
                  onPressed: () {
                    bankAccount.decrement(1);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-10"),
                  onPressed: () {
                    bankAccount.decrement(10);
                  },
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(0),
                  child: Text("-100"),
                  onPressed: () {
                    bankAccount.decrement(100);
                  },
                ),
              ].map(
                (child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 40,
                    child: child,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}