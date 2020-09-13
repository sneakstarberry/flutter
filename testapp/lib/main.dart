import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/provider/counter_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CounterProvider(0),
          )
        ],
        child: MyHomePage(title: 'Provider Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final counter = Provider.of<CounterProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Consumer<CounterProvider>(
                builder: (_, counter, child) => Text(
                  '${counter.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: counter.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: counter.decrementCounter,
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: counter.resetCounter,
            tooltip: 'reset',
            child: Icon(Icons.refresh),
          ),
        ),
      ]),
    );
  }
}
// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;
//   // void _decrementCounter() {
//   //   setState(() {
//   //     _counter--;
//   //   });
//   // }

//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }
//   // void _resetCounter() {
//   //   setState(() {
//   //     _counter = 0;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final CounterProvider counter = Provider.of<CounterProvider>(context);
//     return Scaffold(
//       appBar: AppBar(

//         title: Text(widget.title),
//       ),
//       body: Center(

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '${counter.counter}',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton:
//           Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(15),
//           child: FloatingActionButton(
//             onPressed: counter.incrementCounter,
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(15),
//           child: FloatingActionButton(
//             onPressed: counter.decrementCounter,
//             tooltip: 'decrement',
//             child: Icon(Icons.remove),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(15),
//           child: FloatingActionButton(
//             onPressed: counter.resetCounter,
//             tooltip: 'reset',
//             child: Icon(Icons.refresh),
//           ),
//         ),
//       ]), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
