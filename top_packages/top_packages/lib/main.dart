import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_packages/second_page.dart';
import 'package:top_packages/third_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'accountModel.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("you pressed main page");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BankAccount>(create: (_) => BankAccount()),
        Provider<String>.value(value: "Park"),
      ],
      child: MaterialApp(
        title: "Provider Test",
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<String>(context));
    BankAccount bankAccount = Provider.of<BankAccount>(context);
    String name = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Provider Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your Name is '$name'"),
            Text("Your balance is ${bankAccount.getBalance()}"),
            RaisedButton(
              child: Text("Test with StatefulWidget"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestSFW()));
              },
            ),
            RaisedButton(
              child: Text("Test with StatelessWifet"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestSLW()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
